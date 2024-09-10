
DROP TABLE IF EXISTS superleague_raw.player_transfers;
CREATE TABLE superleague_raw.player_transfers AS 
select distinct player, transfer_season, transferdate, `from` as from_club, `to` as `to_club`, tm_playerid
FROM 
(
SELECT player, CONCAT(
        CASE 
            WHEN SUBSTRING(season, 1, 2) < 50 THEN CONCAT('20', SUBSTRING(season, 1, 2))
            ELSE CONCAT('19', SUBSTRING(season, 1, 2))
        END,
        '-',
        CASE 
            WHEN SUBSTRING(season, 4, 2) < 50 THEN CONCAT('20', SUBSTRING(season, 4, 2))
            ELSE CONCAT('19', SUBSTRING(season, 4, 2))
        END
    ) AS transfer_season, DATE_FORMAT(STR_TO_DATE(COALESCE(`date`), '%b %d, %Y'), '%Y-%m-%d') AS transferdate, `from`, `to`, tm_playerid
FROM superleague_clubs.`marseille_transferhistory` WHERE DATE_FORMAT(STR_TO_DATE(COALESCE(`date`), '%b %d, %Y'), '%Y-%m-%d') >= '1990-01-01'
) a;

DROP TABLE IF EXISTS superleague_raw.`$player_team_assignments`;
CREATE TABLE superleague_raw.`$player_team_assignments` 
AS 
SELECT distinct a.player, a.club, a.start_date, b.end_date, a.tm_playerid FROM 
(
SELECT player, to_club as club, MIN(transferdate) AS start_date, tm_playerid
FROM superleague_raw.player_transfers
GROUP BY player, to_club, tm_playerid
) a
LEFT JOIN 
(
SELECT player, from_club as club, MAX(transferdate) AS end_date, tm_playerid
FROM superleague_raw.player_transfers
GROUP BY player, from_club, tm_playerid
) b ON a.tm_playerid = b.tm_playerid AND a.club = b.club;

-- SELECT * FROM superleague_raw.`$player_team_assignments`;

SET @row_num = (SELECT MAX(assignment_id) FROM Player_Team_Assignment);
DROP TABLE IF EXISTS superleague_raw.pta_new ;
CREATE TABLE superleague_raw.pta_new AS 
SELECT 
@row_num := @row_num + 1 as assignment_id,
p.player_id, t.team_id, pt.club, start_date, end_date 
FROM superleague_raw.`$player_team_assignments` pt
JOIN Player p ON p.tm_playerid = pt.tm_playerid
LEFT JOIN Team t ON t.team_name = pt.club
ORDER BY player, start_date desc;

SELECT * FROM superleague_raw.pta_new;

INSERT INTO Player_Team_Assignment(assignment_id, player_id, team_id, team_name, start_date, end_date)
SELECT assignment_id, player_id, team_id, club, start_date, end_date 
FROM superleague_raw.pta_new;

UPDATE Player_Team_Assignment t 
	JOIN Team f ON t.team_name = f.team_abbreviation
    SET t.team_id = f.team_id
    WHERE t.team_id IS NULL;

