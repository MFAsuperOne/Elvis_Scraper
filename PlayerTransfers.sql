
/* Insert Transfer Data */

 
DROP TABLE IF EXISTS superleague_raw.transfers_new; 
SET @row_num = (SELECT MAX(transfer_id) FROM Transfer);
CREATE TABLE superleague_raw.transfers_new AS 
SELECT 
@row_num := @row_num + 1 as transfer_id,
p.player_id,
t.`from` AS from_team,
NULL AS from_team_id,
t.`to` AS to_team,
NULL AS to_team_id,
DATE_FORMAT(STR_TO_DATE(t.`date`, '%b %d, %Y'), '%Y-%m-%d') as transfer_date,
t.fee AS transfer_fee, 
CASE WHEN t.fee LIKE '%loan%' THEN 1 ELSE 0 END AS isLoan,
CONCAT(
        CASE 
            WHEN SUBSTRING(t.season, 1, 2) < 50 THEN CONCAT('20', SUBSTRING(t.season, 1, 2))
            ELSE CONCAT('19', SUBSTRING(t.season, 1, 2))
        END,
        '-',
        CASE 
            WHEN SUBSTRING(t.season, 4, 2) < 50 THEN CONCAT('20', SUBSTRING(t.season, 4, 2))
            ELSE CONCAT('19', SUBSTRING(t.season, 4, 2)) END
	) AS season
FROM 
superleague_clubs.`$valencia_transferhistory` t
JOIN Player p ON t.tm_playerid = p.tm_playerid; 

SELECT * FROM superleague_raw.transfers_new;

UPDATE superleague_raw.transfers_new t 
	JOIN Team f ON t.from_team = f.team_abbreviation 
    SET t.from_team_id = f.team_id
    WHERE t.from_team_id IS NULL;

UPDATE superleague_raw.transfers_new t 
	JOIN Team f ON t.to_team = f.team_abbreviation 
    SET t.to_team_id = f.team_id
    WHERE t.to_team_id IS NULL;

INSERT INTO Transfer (transfer_id, player_id, from_team, from_team_id, to_team, to_team_id, transfer_date, transfer_fee, isLoan, season)
SELECT * FROM superleague_raw.transfers_new;

UPDATE Transfer t 
	JOIN Team f ON t.from_team = f.team_name
    SET t.from_team_id = f.team_id
    WHERE t.from_team_id IS NULL;

UPDATE Transfer t 
	JOIN Team f ON t.to_team = f.team_name
    SET t.to_team_id = f.team_id
    WHERE t.to_team_id IS NULL;


