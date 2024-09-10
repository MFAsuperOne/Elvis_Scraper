SELECT DISTINCT Opponent
FROM superleague_clubs.`$Internazionale-matches` 
WHERE Comp = 'La Liga';

SELECT COUNT(*) FROM superleague_clubs.`$Internazionale-matches`;

SELECT * FROM League;

/* Update the matches for club to reflect the correct competition name in the DB */

UPDATE superleague_clubs.`$Internazionale-matches` SET Comp = 'UEFA Champions League' WHERE Comp = 'Champions Lg';
UPDATE superleague_clubs.`$Internazionale-matches` SET Comp = 'UEFA Europa League' WHERE Comp = 'Europa Lg';
#UPDATE superleague_clubs.`$Internazionale-matches` SET Comp = 'UEFA Super Cup' WHERE Comp = 'Super Cup';
#UPDATE superleague_clubs.`$Internazionale-matches` SET Comp = 'Coppa Italia' WHERE Comp = 'Coppa Italia';
UPDATE superleague_clubs.`$Internazionale-matches` SET Comp = 'Supercoppa Italiana' WHERE Comp = 'Supercoppa';

/* Check if the cup competitions exist and ensure all the match rounds are present */

DROP TABLE IF EXISTS superleague_raw.comps_rounds; 
CREATE TABLE superleague_raw.comps_rounds 
(
	comp NVARCHAR (100),
    rounds NVARCHAR (100)
);
INSERT INTO superleague_raw.comps_rounds 
VALUES
('Coppa Italia','Preliminary round'),
('Coppa Italia','First round'),
('Coppa Italia','Second round'),
('Coppa Italia','Round of 32'),
('Coppa Italia','Round of 16'),
('Coppa Italia','Quarter-finals'),
('Coppa Italia','Semi-finals'),
('Coppa Italia','Finals'),
('Supercoppa Italiana','Finals');

DROP TABLE IF EXISTS superleague_raw.`$rounds`;
CREATE TABLE superleague_raw.`$rounds` AS 
SELECT distinct rounds, s.season_name, l.league_name, s.season_id
FROM superleague_raw.comps_rounds cr 
JOIN Season s 
JOIN League l ON l.league_id = s.league_id AND l.league_name = cr.comp;

SET @row_num = (SELECT MAX(round_id) FROM Rounds);
INSERT INTO Rounds (round_id, season_id, round_name)
SELECT 
@row_num := @row_num + 1 as round_id,
season_id,
rounds AS round_name
FROM superleague_raw.`$rounds`;


/* Fix the Season Name on Cup competitions */

SELECT * FROM superleague_clubs.`$Internazionale-matches` WHERE Comp = 'Supercoppa Italiana';
UPDATE superleague_clubs.`$Internazionale-matches` SET season = SUBSTRING_INDEX(season, '-', -1) WHERE Comp = 'Supercopa de España';

/* Insert Teams */

DROP TABLE IF EXISTS superleague_raw.`$teams`;
CREATE TABLE superleague_raw.`$teams` AS 
SELECT distinct `Opponent` FROM superleague_clubs.`$Internazionale-matches`;

SET @row_num = (SELECT MAX(team_id) FROM Team);
INSERT IGNORE INTO `Team` (team_id, team_name, fbref_team_name, national)
SELECT @row_num := @row_num + 1 as team_id,
`Opponent` as team_name,
`Opponent` as fbref_team_name,
0 as national 
FROM superleague_raw.`$teams` t
LEFT JOIN 
    `Team` existing ON t.`Opponent` = existing.fbref_team_name
WHERE 
    existing.team_name IS NULL;

/* Update CountryID in Team for League Games */

UPDATE Team t 
JOIN superleague_clubs.`$Internazionale-matches` am ON t.fbref_team_name = am.Opponent AND am.Comp = 'Serie A'
SET t.country_id = (SELECT country_id FROM Country WHERE country_name = 'Italy');

select * from Team where team_name LIKE '%Inter%';


/* Insert Stadium Names */

/*
DROP TABLE IF EXISTS superleague_raw.`$stadiums`;
CREATE TABLE superleague_raw.`$stadiums` AS 
SELECT distinct m.Venue, t.country_id, t.team_id, t.fbref_team_name
FROM superleague_clubs.`$Internazionale-matches` m 
JOIN Team t ON m.Opponent = t.fbref_team_name AND m.Venue = 'Home';

SET @row_num = (SELECT MAX(stadium_id) FROM Stadium);
INSERT IGNORE INTO Stadium (stadium_id, stadium_name, country_id, home_team_id)
SELECT 
@row_num := @row_num + 1 as stadium_id,
Venue, s.country_id, s.team_id 
FROM superleague_raw.`$stadiums` s
LEFT JOIN 
    `Stadium` existing ON s.`Venue` = existing.stadium_name
WHERE 
    existing.stadium_name IS NULL;
*/

/* Insert Referee Information */

select * from Referee;

DROP TABLE IF EXISTS superleague_raw.`$referees`;
CREATE TABLE superleague_raw.`$referees` AS 
SELECT DISTINCT Referee from superleague_clubs.`$Internazionale-matches`;

SET @row_num = (SELECT MAX(referee_id) FROM Referee);
INSERT IGNORE INTO Referee (referee_id, first_name)
SELECT @row_num := @row_num + 1 as referee_id, Referee
FROM superleague_raw.`$referees` r
LEFT JOIN 
    `Referee` existing ON r.`Referee` = existing.first_name
WHERE 
    existing.first_name IS NULL;


/* Insert Player Information */ 

DROP TABLE IF EXISTS superleague_raw.`$players`;

CREATE TABLE superleague_raw.`$players` AS 
SELECT DISTINCT p.Player, p.fbref_playerid, DATE_FORMAT(STR_TO_DATE(COALESCE(t1.birthdate, t2.birthdate), '%b %d, %Y'), '%Y-%m-%d') AS DOB, COALESCE(t1.mainposition, t2.mainposition) as mainposition -- , t.shirt_number
FROM superleague_clubs.`$Internazionale-players` p
LEFT JOIN superleague_clubs.`$transfermarkt_inter-milan` t1  ON t1.playername = p.Player AND t1.season = p.season
LEFT JOIN superleague_clubs.`$transfermarkt_inter-milan` t2  ON t2.playername = p.Player AND t2.season = p.season AND t2.birthdate IS NOT NULL AND t2.mainposition IS NOT NULL
GROUP BY p.Player, p.fbref_playerid;

SET @row_num = (SELECT MAX(player_id) FROM Player);
INSERT IGNORE INTO superleague.Player (player_id, `name`, fbref_playerid, date_of_birth, position)
SELECT @row_num := @row_num + 1 as player_id, 
p.Player, p.fbref_playerid, DOB, p.mainposition
FROM superleague_raw.`$players` p
LEFT JOIN 
    `Player` existing ON p.fbref_playerid = existing.fbref_playerid
WHERE 
    existing.fbref_playerid IS NULL;


-- Insert League Rounds 
DROP TABLE IF EXISTS superleague_raw.`$rounds`;
CREATE TABLE superleague_raw.`$rounds` AS 
SELECT distinct `Round` FROM superleague_clubs.`$Internazionale-matches` m
WHERE m.Comp = 'Serie A';

SET @row_num = (SELECT MAX(round_id) FROM Rounds);
INSERT INTO Rounds (round_id, season_id, round_name)
SELECT 
@row_num := @row_num + 1 as round_id, s.season_id, r.Round
FROM superleague_raw.`$rounds` r
JOIN Season s 
JOIN League l ON s.league_id = l.league_id
WHERE l.league_name = 'Serie A'; -- and s.season_name = '2021-2022';


/* Insert Match Data For the club */ 

SET @row_num = (SELECT MAX(match_id) FROM Matches);
INSERT INTO superleague.`Matches` (match_id, season_id, home_team_id, away_team_id, round_id, referee_id, match_date, match_time, home_team_score, away_team_score, match_day, fbref_matchId)
SELECT @row_num := @row_num + 1 as match_id,
s.season_id,
CASE WHEN Venue = 'Home' THEN t.team_id ELSE o.team_id END AS home_team_id,
CASE WHEN Venue = 'Away' THEN t.team_id ELSE o.team_id END AS away_team_id,
r.round_id,
re.referee_id,
m.`Date`,
m.`Time`,
CASE WHEN Venue = 'Home' THEN m.GF ELSE m.GA END AS home_team_score,
CASE WHEN Venue = 'Away' THEN m.GF ELSE m.GA END AS away_team_score,
m.`Day`,
m.fbref_matchid
FROM superleague_clubs.`$Internazionale-matches` m 
JOIN `Team` o ON o.fbref_team_name = m.Opponent
JOIN `Team` t ON t.fbref_team_name = 'Internazionale'
LEFT JOIN `Referee` re ON m.Referee = re.first_name
-- LEFT JOIN `Stadium` s ON m.Venue = s.stadium_name
JOIN `League` l ON TRIM(l.league_name) = TRIM(m.Comp)
JOIN `Season` s ON l.league_id = s.league_id AND TRIM(s.season_name) = TRIM(m.season)
JOIN `Rounds` r ON TRIM(r.round_name) = TRIM(m.Round) AND r.season_id = s.season_id;

/* Insert player stats for each match */

DROP TABLE IF EXISTS superleague_raw.`$playerstats`;
SET @row_num = (SELECT MAX(stats_id) FROM PlayerStats);
CREATE TABLE superleague_raw.`$playerstats` AS 
SELECT 
@row_num := @row_num + 1 as stats_id,
pm.fbref_playerid, m.match_id, pm.Gls, pm.Ast, pm.CrdY, pm.CrdR, pm.Min, pm.Pos
FROM 
Matches m 
JOIN superleague_clubs.`$Internazionale-player-details` pm ON m.fbref_matchid = pm.fbref_matchid
JOIN superleague_clubs.`$Internazionale-matches` mr ON mr.fbref_matchid = pm.fbref_matchid
WHERE pm.fbref_matchid IS NOT NULL;

SET @teamid = (SELECT team_id FROM Team WHERE fbref_team_name = 'Internazionale');
INSERT INTO PlayerStats (stats_id, match_id, player_id, goals_scored, assists, yellow_cards, red_cards, minutes_played, `position`, team_id)
SELECT stats_id, match_id, p.player_id, Gls, Ast, CrdY, CrdR, `Min`, Pos, @teamid
FROM superleague_raw.`$playerstats` ps 
JOIN `Player` p ON TRIM(p.fbref_playerid) = (ps.fbref_playerid);


/* Update Captaincy for PlayerStats */

DROP TABLE IF EXISTS superleague_raw.`captaincy`;
CREATE TABLE superleague_raw.captaincy AS 
SELECT distinct m.match_id, p.player_id
FROM superleague_clubs.`$Internazionale-matches` im
JOIN Matches m ON m.fbref_matchid = im.fbref_matchid
JOIN Player p ON im.Captain = p.name;

UPDATE PlayerStats ps 
JOIN superleague_raw.captaincy c ON ps.match_id = c.match_id AND ps.player_id = c.player_id
SET isCaptain = 1;


/* Update Squad Number in PlayerStats from TransferMarkt */

UPDATE PlayerStats ps 
JOIN Player p ON p.player_id = ps.player_id 
JOIN superleague_clubs.`$transfermarkt_inter-milan` t ON t.playername = p.name 
JOIN Matches m ON ps.match_id = m.match_id 
JOIN Season s ON m.season_id = s.season_id AND t.season = s.season_name
SET ps.shirt_num = t.shirt_number;


/* Insert Club Manager History */ 

DROP TABLE IF EXISTS superleague_clubs.managers_transfers ;
CREATE TABLE superleague_clubs.managers_transfers 
AS 
SELECT * FROM 
(
select 'Inter' as club, `Unnamed: 0` as manager, DATE_FORMAT(STR_TO_DATE(`From`, '%d %b, %Y'), '%Y-%m-%d') AS from_date, DATE_FORMAT(STR_TO_DATE(`To`, '%d %b, %Y'), '%Y-%m-%d') as to_date 
from superleague_clubs.`intermilan_managers`
) a
WHERE (a.from_date IS NOT NULL);

SET @row_num = 0;
INSERT INTO Manager_Team_Assignment (assignment_id, manager_id, team_id, start_date, end_date)
SELECT 
@row_num := @row_num + 1 as assignment_id,
m.manager_id, t.team_id, from_date, to_date
FROM superleague_clubs.managers_transfers mt 
JOIN Manager m ON mt.manager = m.name
JOIN Team t ON mt.club = t.team_name;


/* Insert Player Tranfers */
SET @row_num = (SELECT MAX(transfer_id) FROM Transfer);
INSERT INTO Transfer (transfer_id, player_id, from_team_id, from_team, to_team_id, to_team, transfer_date, transfer_fee) 
SELECT 
@row_num := @row_num + 1 AS transfer_id,
p.player_id, 
ft.team_id AS from_team_id,
ft.team_name AS from_team, 
tt.team_id AS to_team_id,
tt.team_name AS to_team,
DATE_FORMAT(STR_TO_DATE(th.`date`, '%b %d, %Y'), '%Y-%m-%d') as transfer_date,
th.fee AS transfer_fee  
FROM superleague_clubs.`$inter-milan_transferhistory` th 
JOIN Player p ON th.player = p.name 
LEFT JOIN Team ft ON th.`from` = ft.team_name
LEFT JOIN Team tt ON th.`to` = tt.team_name
LEFT JOIN Transfer existing ON existing.player_id = p.player_id AND existing.transfer_date = DATE_FORMAT(STR_TO_DATE(th.`date`, '%b %d, %Y'), '%Y-%m-%d')
WHERE existing.transfer_id IS NULL;






