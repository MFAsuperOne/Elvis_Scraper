SELECT * FROM superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam`;

SELECT DISTINCT Comp FROM superleague_clubs.`$Marseille-matches`;

SELECT * FROM Country WHERE country_name LIKE '%Italy%';
UPDATE Team SET country_id = 140 WHERE team_id IN (268, 349, 474, 515, 316, 615, 531, 314, 338, 373, 462, 641, 371);

SELECT r.*, t.* FROM superleague_raw.teams r 
LEFT JOIN Team t ON t.team_name = r.Team;

ALTER TABLE  superleague_clubs.`transfermarket_matches_ajax-amsterdam` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` r 
JOIN Team t ON t.fbref_team_name = r.HomeTeam
SET r.HomeTeam = t.team_name;

UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` r 
JOIN Team t ON t.team_abbreviation = r.HomeTeam
SET r.HomeTeam = t.team_name;

UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` r 
JOIN Team t ON t.fbref_team_name = r.AwayTeam
SET r.AwayTeam = t.team_name;

UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` r 
JOIN Team t ON t.team_abbreviation = r.AwayTeam
SET r.AwayTeam = t.team_name;

SELECT DISTINCT r.HomeTeam FROM superleague_clubs.`transfermarket_matches_ajax-amsterdam` r 
LEFT JOIN Team t ON t.team_name = r.HomeTeam
WHERE t.team_id IS NULL;

SELECT * FROM Team WHERE team_name LIKE '%weze%';

UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'FC Twente Enschede' WHERE HomeTeam = 'Twente FC ';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'FC Twente Enschede' WHERE AwayTeam = 'Twente FC ';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Paris Saint-Germain FC' WHERE HomeTeam = 'Paris SG';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Paris Saint-Germain FC' WHERE AwayTeam = 'Paris SG';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Olympiakos Nicosia' WHERE HomeTeam = 'APOEL Nicosia';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Olympiakos Nicosia' WHERE AwayTeam = 'APOEL Nicosia';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'FK Dukla Banská Bystrica' WHERE HomeTeam = 'Banska Bystrica';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'FK Dukla Banská Bystrica' WHERE AwayTeam = 'Banska Bystrica';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Borussia Dortmund' WHERE HomeTeam = 'Bor. Dortmund';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Borussia Dortmund' WHERE AwayTeam = 'Bor. Dortmund';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Hapoel Haifa FC' WHERE HomeTeam = 'Hapoel Haifa';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Hapoel Haifa FC' WHERE AwayTeam = 'Hapoel Haifa';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Heracles Almelo' WHERE HomeTeam = 'Heracles';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Heracles Almelo' WHERE AwayTeam = 'Heracles';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'FC Internazionale Milano' WHERE HomeTeam = 'Inter';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'FC Internazionale Milano' WHERE AwayTeam = 'Inter';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Legia Warsaw' WHERE HomeTeam = 'Legia Warszawa';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Legia Warsaw' WHERE AwayTeam = 'Legia Warszawa';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Lille OSC' WHERE HomeTeam = 'LOSC Lille';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Lille OSC' WHERE AwayTeam = 'LOSC Lille';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Manchester City FC' WHERE HomeTeam = 'Man City';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Manchester City FC' WHERE AwayTeam = 'Man City';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Manchester United FC' WHERE HomeTeam = 'Man Utd';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Manchester United FC' WHERE AwayTeam = 'Man Utd';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Molde Fotballklubb' WHERE HomeTeam = 'Molde FK';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Molde Fotballklubb' WHERE AwayTeam = 'Molde FK';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Olympique Lyonnais' WHERE HomeTeam = 'Olympique Lyon';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Olympique Lyonnais' WHERE AwayTeam = 'Olympique Lyon';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'R.S.C. Anderlecht' WHERE HomeTeam = 'RSC Anderlecht';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'R.S.C. Anderlecht' WHERE AwayTeam = 'RSC Anderlecht';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'ŠK Slovan Bratislava' WHERE HomeTeam = 'Slo. Bratislava';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'ŠK Slovan Bratislava' WHERE AwayTeam = 'Slo. Bratislava';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Sparta Rotterdam' WHERE HomeTeam = 'Sparta R. ';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Sparta Rotterdam' WHERE AwayTeam = 'Sparta R. ';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Vitoria SC Guimaraes' WHERE HomeTeam = 'Vit. Guimarães';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Vitoria SC Guimaraes' WHERE AwayTeam = 'Vit. Guimarães';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'VVV-Venlo' WHERE HomeTeam = 'VVV';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'VVV-Venlo' WHERE AwayTeam = 'VVV';

UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET HomeTeam = 'Brøndby IF' WHERE HomeTeam = 'Bröndby IF';
UPDATE superleague_clubs.`transfermarket_matches_ajax-amsterdam` SET AwayTeam = 'Brøndby IF' WHERE AwayTeam = 'Bröndby IF';

ALTER TABLE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` r 
JOIN Team t ON t.fbref_team_name = r.HomeTeam
SET r.HomeTeam = t.team_name;

UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` r 
JOIN Team t ON t.team_abbreviation = r.HomeTeam
SET r.HomeTeam = t.team_name;

UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` r 
JOIN Team t ON t.fbref_team_name = r.AwayTeam
SET r.AwayTeam = t.team_name;

UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` r 
JOIN Team t ON t.team_abbreviation = r.AwayTeam
SET r.AwayTeam = t.team_name;

SELECT DISTINCT r.AwayTeam FROM superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` r 
LEFT JOIN Team t ON t.team_name = r.AwayTeam
WHERE t.team_id IS NULL;

UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'FC Twente Enschede' WHERE HomeTeam = 'Twente FC ';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'FC Twente Enschede' WHERE AwayTeam = 'Twente FC ';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Paris Saint-Germain FC' WHERE HomeTeam = 'Paris SG';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Paris Saint-Germain FC' WHERE AwayTeam = 'Paris SG';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Olympiakos Nicosia' WHERE HomeTeam = 'APOEL Nicosia';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Olympiakos Nicosia' WHERE AwayTeam = 'APOEL Nicosia';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'FK Dukla Banská Bystrica' WHERE HomeTeam = 'Banska Bystrica';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'FK Dukla Banská Bystrica' WHERE AwayTeam = 'Banska Bystrica';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Borussia Dortmund' WHERE HomeTeam = 'Bor. Dortmund';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Borussia Dortmund' WHERE AwayTeam = 'Bor. Dortmund';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Hapoel Haifa FC' WHERE HomeTeam = 'Hapoel Haifa';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Hapoel Haifa FC' WHERE AwayTeam = 'Hapoel Haifa';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Heracles Almelo' WHERE HomeTeam = 'Heracles';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Heracles Almelo' WHERE AwayTeam = 'Heracles';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'FC Internazionale Milano' WHERE HomeTeam = 'Inter';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'FC Internazionale Milano' WHERE AwayTeam = 'Inter';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Legia Warsaw' WHERE HomeTeam = 'Legia Warszawa';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Legia Warsaw' WHERE AwayTeam = 'Legia Warszawa';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Lille OSC' WHERE HomeTeam = 'LOSC Lille';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Lille OSC' WHERE AwayTeam = 'LOSC Lille';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Manchester City FC' WHERE HomeTeam = 'Man City';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Manchester City FC' WHERE AwayTeam = 'Man City';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Manchester United FC' WHERE HomeTeam = 'Man Utd';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Manchester United FC' WHERE AwayTeam = 'Man Utd';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Molde Fotballklubb' WHERE HomeTeam = 'Molde FK';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Molde Fotballklubb' WHERE AwayTeam = 'Molde FK';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Olympique Lyonnais' WHERE HomeTeam = 'Olympique Lyon';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Olympique Lyonnais' WHERE AwayTeam = 'Olympique Lyon';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'R.S.C. Anderlecht' WHERE HomeTeam = 'RSC Anderlecht';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'R.S.C. Anderlecht' WHERE AwayTeam = 'RSC Anderlecht';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'ŠK Slovan Bratislava' WHERE HomeTeam = 'Slo. Bratislava';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'ŠK Slovan Bratislava' WHERE AwayTeam = 'Slo. Bratislava';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Sparta Rotterdam' WHERE HomeTeam = 'Sparta R. ';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Sparta Rotterdam' WHERE AwayTeam = 'Sparta R. ';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'Vitoria SC Guimaraes' WHERE HomeTeam = 'Vit. Guimarães';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'Vitoria SC Guimaraes' WHERE AwayTeam = 'Vit. Guimarães';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET HomeTeam = 'VVV-Venlo' WHERE HomeTeam = 'VVV';
UPDATE superleague_clubs.`transfermarket_playerdetails_ajax-amsterdam` SET AwayTeam = 'VVV-Venlo' WHERE AwayTeam = 'VVV';

DROP TABLE IF EXISTS superleague_raw.`teams`;
CREATE TABLE superleague_raw.`teams` AS 
SELECT DISTINCT Comp, Team FROM 
(
  SELECT DISTINCT Comp, HomeTeam AS Team FROM superleague_clubs.`transfermarket_matches_ajax-amsterdam` r
    -- LEFT JOIN Team t ON t.team_name = r.HomeTeam WHERE t.team_id IS NULL
  UNION 
  SELECT DISTINCT Comp, AwayTeam AS Team FROM superleague_clubs.`transfermarket_matches_ajax-amsterdam` r
    -- LEFT JOIN Team t ON t.team_name = r.AwayTeam WHERE t.team_id IS NULL
) a;

SELECT * FROM superleague_raw.`teams`;
SELECT * FROM Team WHERE team_name LIKE '%bro%';

DELETE FROM superleague_clubs.`$Ajax-players` WHERE Player = 'Ajax';

DROP TABLE IF EXISTS superleague_raw.`$players`;
CREATE TABLE superleague_raw.`$players` AS 
SELECT DISTINCT Player, fbref_playerid, playername, mainposition, birthdate, player_url
FROM 
(
SELECT DISTINCT f.Player, fbref_playerid, t.playername,  t.mainposition, t.birthdate, t.player_url
FROM superleague_clubs.`$Ajax-players` f
	JOIN superleague_clubs.`transfermarkt_players_as-rom` t ON TRIM(f.Player) = TRIM(t.playername) 
UNION    
SELECT DISTINCT f.Player, fbref_playerid, t.playername, t.mainposition, t.birthdate, t.player_url
FROM superleague_clubs.`$Ajax-players` f
	JOIN superleague_clubs.`transfermarkt_players_as-rom` t ON TRIM(f.Player) = TRIM(t.playername) 
)a; 

DROP TABLE IF EXISTS superleague_raw.`ajax_fbref_players`;
CREATE TABLE superleague_raw.`ajax_fbref_players` AS 
SELECT DISTINCT f.Player, fbref_playerid, t.playername 
FROM superleague_clubs.`$Ajax-players` f
	LEFT JOIN superleague_clubs.`transfermarkt_players_as-rom` t ON TRIM(f.Player) = TRIM(t.playername) WHERE t.playername IS NULL; 
DROP TABLE IF EXISTS superleague_raw.`ajax_tm_players`;    
CREATE TABLE superleague_raw.`ajax_tm_players` AS   
SELECT DISTINCT t.playername, t.mainposition, t.birthdate, t.player_url
FROM superleague_clubs.`$Ajax-players` f
	RIGHT JOIN superleague_clubs.`transfermarkt_players_as-rom` t ON TRIM(f.Player) = TRIM(t.playername) WHERE f.Player IS NULL;


/*
	!!! The below table must be cleaned up using Fuzzy Logic!! 
*/
SELECT * FROM superleague_raw.`ajax_matched_players`;
SELECT * FROM superleague_raw.`$players`;

INSERT INTO superleague_raw.`$players`
SELECT Player, fbref_playerid, playername, mainposition, birthday, player_url FROM superleague_raw.`ajax_matched_players`;

DELETE FROM superleague_raw.`ajax_fbref_players` WHERE fbref_playerid IN (SELECT fbref_playerid FROM superleague_raw.`ajax_matched_players`);
DELETE FROM superleague_raw.`ajax_tm_players` WHERE playername IN (SELECT playername FROM superleague_raw.`ajax_matched_players`);

SELECT * FROM superleague_raw.`ajax_fbref_players`;
SELECT * FROM superleague_raw.`ajax_tm_players` WHERE playername LIKE '%kudus%';

UPDATE superleague_raw.`ajax_tm_players` SET playername = 'Kennedy Bakircioglü' WHERE playername = 'Kennedy';
UPDATE superleague_raw.`ajax_tm_players` SET playername = 'Kudus Mohammed' WHERE playername = 'Mohammed Kudus';

INSERT INTO superleague_raw.`$players`
SELECT DISTINCT f.Player, fbref_playerid, t.playername,  t.mainposition, t.birthdate, t.player_url
FROM superleague_raw.`ajax_fbref_players` f
	JOIN superleague_raw.`ajax_tm_players` t ON TRIM(f.Player) = TRIM(t.playername); 

DELETE FROM superleague_raw.`ajax_fbref_players` WHERE Player IN ('Kennedy Bakircioglü', 'Kudus Mohammed');
DELETE FROM superleague_raw.`ajax_tm_players` WHERE playername IN ('Kennedy Bakircioglü', 'Kudus Mohammed');

SELECT * FROM superleague_raw.`ajax_fbref_players`;
SELECT * FROM superleague_raw.`ajax_tm_players` WHERE playername LIKE '%kudus%';

DROP TABLE IF EXISTS superleague_raw.`$unmatched_players`;
CREATE TABLE superleague_raw.`$unmatched_players` AS 
SELECT DISTINCT Player, fbref_playerid, playername, mainposition, birthdate, player_url
FROM 
(
SELECT DISTINCT f.Player, fbref_playerid, t.playername,  t.mainposition, t.birthdate, t.player_url
FROM superleague_raw.`ajax_fbref_players` f
	LEFT JOIN superleague_raw.`ajax_tm_players` t ON TRIM(f.Player) = TRIM(t.playername) 
UNION    
SELECT DISTINCT f.Player, fbref_playerid, t.playername, t.mainposition, t.birthdate, t.player_url
FROM superleague_raw.`ajax_fbref_players` f
	RIGHT JOIN superleague_raw.`ajax_tm_players` t ON TRIM(f.Player) = TRIM(t.playername) 
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
SELECT * FROM superleague_raw.`$teams`;

SELECT DISTINCT Comp
FROM superleague_clubs.`$Roma-matches`;
SELECT DISTINCT Comp
FROM superleague_clubs.`transfermarket_playerdetails_as-rom`;

DELETE FROM superleague_clubs.`transfermarket_playerdetails_as-rom` WHERE Comp NOT IN 
(SELECT DISTINCT Comp
FROM superleague_clubs.`$Roma-matches`);

SELECT *
FROM superleague_clubs.`$Roma-matches` WHERE Comp = 'Johan Cruijff Schaal';
SELECT DISTINCT Comp
FROM superleague_clubs.`transfermarket_playerdetails_as-rom`;
SELECT * FROM League;

DROP TABLE IF EXISTS superleague_raw.comps_rounds; 
CREATE TABLE superleague_raw.comps_rounds 
(
	comp NVARCHAR (100),
    rounds NVARCHAR (100)
);
INSERT INTO superleague_raw.comps_rounds 
VALUES
('KNVB beker','First Preliminary round'),
('KNVB beker','Speiltag round'),
('KNVB beker','First round'),
('KNVB beker','Round of 16'),
('KNVB beker','Quarter-finals'),
('KNVB beker','Semi-finals'),
('KNVB beker','Finals'),
('Johan Cruijff Schaal','Finals');

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

#UPDATE superleague_clubs.`$Roma-matches` SET Comp = 'Copa Libertadores de América' WHERE Comp = 'Copa Libertadores';

/* Fix the matchday & round names in raw data */

UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Qualifying round' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%Qualifying%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Group stage' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%Group%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Quarter-finals' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%Quarter%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Semi-finals' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%Semi%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Round of 16' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%last 16%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Final' WHERE Comp IN ('UEFA Champions League') AND MatchDay = 'final 1st leg';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Final' WHERE Comp IN ('UEFA Champions League') AND MatchDay = 'final 2nd leg';

UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Group stage' WHERE Comp= 'KNVB beker' AND MatchDay LIKE '%Group%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Quarter-finals' WHERE Comp= 'KNVB beker' AND MatchDay LIKE '%Quarter%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Semi-finals' WHERE Comp= 'KNVB beker' AND MatchDay LIKE '%Semi%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = CONCAT('Matchweek ', Matchday) WHERE Comp = 'Eredivisie';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Round of 16' WHERE Comp IN ('KNVB beker') AND MatchDay LIKE '%last 16%';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Final' WHERE Comp IN ('KNVB beker') AND MatchDay = 'final 1st leg';
UPDATE superleague_clubs.`$Roma-matches` SET MatchDay = 'Final' WHERE Comp IN ('KNVB beker') AND MatchDay = 'final 2nd leg';
UPDATE superleague_clubs.`transfermarket_matches_as-rom` SET MatchDay = 'Third Round' WHERE Comp IN ('KNVB beker') AND MatchDay = '3rd round 1st leg';
UPDATE superleague_clubs.`transfermarket_matches_as-rom` SET MatchDay = 'Third Round' WHERE Comp IN ('KNVB beker') AND MatchDay = '3rd round 2nd leg';

UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Group stage' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%Group%';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Quarter-finals' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%Quarter%';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Semi-finals' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%Semi%';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Round of 16' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%last 16%';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Final' WHERE Comp IN ('UEFA Champions League') AND MatchDay = 'final 1st leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Final' WHERE Comp IN ('UEFA Champions League') AND MatchDay = 'final 2nd leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Group stage' WHERE Comp= 'KNVB beker' AND MatchDay LIKE '%Group%';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Quarter-finals' WHERE Comp= 'KNVB beker' AND MatchDay LIKE '%Quarter%';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Semi-finals' WHERE Comp= 'KNVB beker' AND MatchDay LIKE '%Semi%';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Qualifying round' WHERE Comp IN ('UEFA Champions League') AND MatchDay LIKE '%Qualifying%';

UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = CONCAT('Matchweek ', Matchday) WHERE Comp = 'Eredivisie';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Round of 16' WHERE Comp IN ('KNVB beker') AND MatchDay LIKE '%last 16%';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Final' WHERE Comp IN ('KNVB beker') AND MatchDay = 'final 1st leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Final' WHERE Comp IN ('KNVB beker') AND MatchDay = 'final 2nd leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Third Round' WHERE Comp IN ('KNVB beker') AND MatchDay = '3rd round 1st leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_as-rom` SET MatchDay = 'Third Round' WHERE Comp IN ('KNVB beker') AND MatchDay = '3rd round 2nd leg';




