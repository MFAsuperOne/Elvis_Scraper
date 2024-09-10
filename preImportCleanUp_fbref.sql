/* Team data */ 

SELECT * FROM superleague_clubs.`$Marseille-matches` WHERE Date = '2021-02-10';

SELECT DISTINCT Comp FROM superleague_clxubs.`$Marseille-matches`;

SELECT * FROM Country WHERE country_name LIKE '%Spain%';
-- UPDATE Team SET country_id = 140 WHERE team_id IN (268, 349, 474, 515, 316, 615, 531, 314, 338, 373, 462, 641, 371);

SELECT r.*, t.* FROM superleague_raw.teams r 
LEFT JOIN Team t ON t.team_name = r.Team;

ALTER TABLE  superleague_clubs.`$Valencia-matches` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

UPDATE superleague_clubs.`$Valencia-matches` r 
JOIN Team t ON t.fbref_team_name = r.Opponent
SET r.Opponent = t.team_name;

UPDATE superleague_clubs.`$Valencia-matches` r 
JOIN Team t ON t.team_abbreviation = r.Opponent
SET r.Opponent = t.team_name;

SELECT DISTINCT r.Opponent FROM superleague_clubs.`$Valencia-matches` r 
LEFT JOIN Team t ON t.team_name = r.Opponent
WHERE t.team_id IS NULL;

ALTER TABLE superleague_clubs.`$Valencia-player-details` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

UPDATE superleague_clubs.`$Valencia-player-details` r 
JOIN Team t ON t.fbref_team_name = r.Opponent
SET r.Opponent = t.team_name;

UPDATE superleague_clubs.`$Valencia-player-details` r 
JOIN Team t ON t.team_abbreviation = r.Opponent
SET r.Opponent = t.team_name;

SELECT DISTINCT r.Opponent FROM superleague_clubs.`$Valencia-player-details` r 
LEFT JOIN Team t ON t.team_name = r.Opponent
WHERE t.team_id IS NULL AND r.Squad = 'Valencia';

UPDATE superleague_clubs.`transfermarket_playerdetails_fc-valencia` SET HomeTeam = 'FC Twente Enschede' WHERE HomeTeam = 'Twente FC ';
UPDATE superleague_clubs.`transfermarket_playerdetails_fc-valencia` SET AwayTeam = 'FC Twente Enschede' WHERE AwayTeam = 'Twente FC ';

SELECT * FROM superleague_clubs.`$Valencia-player-details`;
SELECT * FROM superleague_clubs.`$Valencia-matches` WHERE Opponent = 'HJK';
SELECT * FROM Team WHERE team_name LIKE '%helsink%';

SELECT * FROM Team WHERE team_name LIKE '%mar%';

UPDATE superleague_clubs.`$Valencia-matches` SET Opponent = 'Deportivo de La Coruña' WHERE Opponent = 'La Coruña';
UPDATE superleague_clubs.`$Valencia-player-details` SET Opponent = 'Deportivo de La Coruña' WHERE Opponent = 'La Coruña';

UPDATE superleague_clubs.`$Valencia-matches` SET Opponent = 'Real Betis Balompie' WHERE Opponent = 'Betis';
UPDATE superleague_clubs.`$Valencia-player-details` SET Opponent = 'Real Betis Balompie' WHERE Opponent = 'Betis';

UPDATE superleague_clubs.`$Valencia-matches` SET Opponent = 'Paris Saint-Germain FC' WHERE Opponent = 'Paris S';
UPDATE superleague_clubs.`$Valencia-player-details` SET Opponent = 'Paris Saint-Germain FC' WHERE Opponent = 'Paris S';

UPDATE superleague_clubs.`$Valencia-matches` SET Opponent = 'Deportivo de La Coruña' WHERE Opponent = 'Dep La Coruña';
UPDATE superleague_clubs.`$Valencia-player-details` SET Opponent = 'Deportivo de La Coruña' WHERE Opponent = 'Dep La Coruña';

UPDATE superleague_clubs.`$Valencia-matches` SET Opponent = 'Atlético de Madrid' WHERE Opponent = 'Atl';
UPDATE superleague_clubs.`$Valencia-player-details` SET Opponent = 'Atlético de Madrid' WHERE Opponent = 'Atl';

UPDATE superleague_clubs.`$Valencia-matches` SET Opponent = 'Stabæk Fotball' WHERE Opponent = 'Stab';
UPDATE superleague_clubs.`$Valencia-player-details` SET Opponent = 'Stabæk Fotball' WHERE Opponent = 'Stab';

UPDATE superleague_clubs.`$Valencia-matches` SET Opponent = 'Stabæk Fotball' WHERE Opponent = 'Stab';
UPDATE superleague_clubs.`$Valencia-player-details` SET Opponent = 'Stabæk Fotball' WHERE Opponent = 'Stab';

/* Player Data */

DELETE FROM superleague_clubs.`$Valencia-players` WHERE Player = 'Valencia';

DROP TABLE IF EXISTS superleague_raw.`$players`;
CREATE TABLE superleague_raw.`$players` AS 
SELECT DISTINCT Player, fbref_playerid, playername, mainposition, birthdate, player_url
FROM 
(
SELECT DISTINCT f.Player, fbref_playerid, t.playername,  t.mainposition, t.birthdate, t.player_url
FROM superleague_clubs.`$Valencia-players` f
	JOIN superleague_clubs.`transfermarkt_players_fc-valencia` t ON TRIM(f.Player) = TRIM(t.playername) AND f.Season = t.Season
UNION    
SELECT DISTINCT f.Player, fbref_playerid, t.playername, t.mainposition, t.birthdate, t.player_url
FROM superleague_clubs.`$Valencia-players` f
	JOIN superleague_clubs.`transfermarkt_players_fc-valencia` t ON TRIM(f.Player) = TRIM(t.playername) 
)a; 

DROP TABLE IF EXISTS superleague_raw.`Valencia_fbref_players`;
CREATE TABLE superleague_raw.`Valencia_fbref_players` AS 
SELECT DISTINCT f.Player, fbref_playerid, t.playername 
FROM superleague_clubs.`$Valencia-players` f
	LEFT JOIN superleague_clubs.`transfermarkt_players_fc-valencia` t ON TRIM(f.Player) = TRIM(t.playername) WHERE t.playername IS NULL; 
DROP TABLE IF EXISTS superleague_raw.`Valencia_tm_players`;    
CREATE TABLE superleague_raw.`Valencia_tm_players` AS   
SELECT DISTINCT t.playername, t.mainposition, t.birthdate, t.player_url
FROM superleague_clubs.`$Valencia-players` f
	RIGHT JOIN superleague_clubs.`transfermarkt_players_fc-valencia` t ON TRIM(f.Player) = TRIM(t.playername) WHERE f.Player IS NULL;
				
/*
	!!! The below table must be cleaned up using Fuzzy Logic!! 
*/

SELECT * FROM superleague_raw.`Valencia_matched_players`;
SELECT * FROM superleague_raw.`$players`;

INSERT INTO superleague_raw.`$players`
SELECT Player, fbref_playerid, playername, mainposition, birthdate, player_url FROM superleague_raw.`Valencia_matched_players`;

DELETE FROM superleague_raw.`Valencia_fbref_players` WHERE fbref_playerid IN (SELECT fbref_playerid FROM superleague_raw.`Valencia_matched_players`);
DELETE FROM superleague_raw.`Valencia_tm_players` WHERE playername IN (SELECT playername FROM superleague_raw.`Valencia_matched_players`);

SELECT * FROM superleague_raw.`Valencia_fbref_players`;
SELECT * FROM superleague_raw.`Valencia_tm_players`;

DROP TABLE IF EXISTS superleague_raw.`$unmatched_players`;
CREATE TABLE superleague_raw.`$unmatched_players` AS 
SELECT DISTINCT Player, fbref_playerid, playername, mainposition, birthdate, player_url
FROM 
(
SELECT DISTINCT f.Player, fbref_playerid, t.playername,  t.mainposition, t.birthdate, t.player_url
FROM superleague_raw.`Valencia_fbref_players` f
	LEFT JOIN superleague_raw.`Valencia_tm_players` t ON TRIM(f.Player) = TRIM(t.playername) 
UNION    
SELECT DISTINCT f.Player, fbref_playerid, t.playername, t.mainposition, t.birthdate, t.player_url
FROM superleague_raw.`Valencia_fbref_players` f
	RIGHT JOIN superleague_raw.`Valencia_tm_players` t ON TRIM(f.Player) = TRIM(t.playername) 
)a; 

ALTER TABLE superleague_raw.`$players` ADD COLUMN tm_playerid NVARCHAR(50);
ALTER TABLE superleague_raw.`$players` ADD COLUMN date_of_birth NVARCHAR(50);
ALTER TABLE superleague_raw.`$unmatched_players` ADD COLUMN tm_playerid NVARCHAR(50);
ALTER TABLE superleague_raw.`$unmatched_players` ADD COLUMN date_of_birth NVARCHAR(50);
UPDATE superleague_raw.`$players` SET tm_playerid = SUBSTRING_INDEX(SUBSTRING_INDEX(player_url, '/', -1), '/', -1);
UPDATE superleague_raw.`$unmatched_players` SET tm_playerid = SUBSTRING_INDEX(SUBSTRING_INDEX(player_url, '/', -1), '/', -1);
UPDATE superleague_raw.`$players` SET date_of_birth = DATE_FORMAT(STR_TO_DATE(birthdate, '%b %d, %Y'), '%Y-%m-%d');
UPDATE superleague_raw.`$unmatched_players` SET date_of_birth = DATE_FORMAT(STR_TO_DATE(birthdate, '%b %d, %Y'), '%Y-%m-%d');

SELECT * FROM superleague_raw.`$players`;
SELECT * FROM superleague_raw.`$unmatched_players`;

SELECT DISTINCT Comp, Round
FROM superleague_clubs.`$Valencia-matches`;
SELECT DISTINCT Comp
FROM superleague_clubs.`transfermarket_playerdetails_fc-valencia`;

UPDATE superleague_clubs.`$Valencia-matches` SET Comp = 'UEFA Champions League' WHERE Comp = 'Champions Lg';
UPDATE superleague_clubs.`$Valencia-matches` SET Comp = 'UEFA Europa League' WHERE Comp = 'Europa Lg';
UPDATE superleague_clubs.`$Valencia-matches` SET Comp = 'UEFA Super Cup' WHERE Comp = 'Super Cup';


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

/* Update the matches for club to reflect the correct competition name in the DB */

#UPDATE superleague_clubs.`$Valencia-matches` SET Comp = 'Copa Libertadores de América' WHERE Comp = 'Copa Libertadores';

/* Fix the matchday & round names in raw data */




