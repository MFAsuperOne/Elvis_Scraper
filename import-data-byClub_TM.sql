SELECT *, SUBSTRING(season, 1, INSTR(season, '-') - 1)
FROM superleague_clubs.`transfermarkt_players_kawasaki-frontale`;

SELECT *
FROM superleague_clubs.`transfermarket_matches_kawasaki-frontale`
WHERE Comp IN (
'J1 League'
);

SELECT * FROM superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` WHERE Comp = 'J1 League' AND season = '1992';

/*
Copa Libertadores de América
Copa Sudamericana
Campeonato Brasileiro Série A
J. League Cup
SuperJ. League Cup
*/

/* Update the matches for club to reflect the correct competition name in the DB */

UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET season = SUBSTRING(season, 1, INSTR(season, '-') - 1) WHERE Comp <> 'AFC Champions League';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET season = SUBSTRING(season, 1, INSTR(season, '-') - 1) WHERE Comp <> 'AFC Champions League';

UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = CONCAT('Matchweek ', Matchday) WHERE Comp LIKE '%J1 League%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = CONCAT('Matchweek ', Matchday) WHERE Comp LIKE '%J1 League%'; 

UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = CONCAT('First Stage ', Matchday), Comp = 'J1 League' WHERE Comp LIKE '%J1 League - First%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = CONCAT('Second Stage ', Matchday), Comp = 'J1 League' WHERE Comp LIKE '%J1 League - Second%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = CONCAT('First Stage ', Matchday), Comp = 'J1 League' WHERE Comp LIKE '%J1 League - First%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = CONCAT('Second Stage ', Matchday), Comp = 'J1 League' WHERE Comp LIKE '%J1 League - Second%';

/* Fix the matchday & round names in raw data */

UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Qualifying round' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%Qualifying%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Group stage' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%Group%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Quarter-finals' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%Quarter%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Semi-finals' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%Semi%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Round of 16' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%last 16%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Final' WHERE Comp IN ('AFC Champions League') AND MatchDay = 'final 1st leg';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Final' WHERE Comp IN ('AFC Champions League') AND MatchDay = 'final 2nd leg';

UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Group stage' WHERE Comp= 'J. League Cup' AND MatchDay LIKE '%Group%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Quarter-finals' WHERE Comp= 'J. League Cup' AND MatchDay LIKE '%Quarter%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Semi-finals' WHERE Comp= 'J. League Cup' AND MatchDay LIKE '%Semi%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Round of 16' WHERE Comp IN ('J. League Cup') AND MatchDay LIKE '%last 16%';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Final' WHERE Comp IN ('J. League Cup') AND MatchDay = 'final 1st leg';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Final' WHERE Comp IN ('J. League Cup') AND MatchDay = 'final 2nd leg';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Second Round' WHERE Comp IN ('J. League Cup') AND MatchDay = 'Second Round 1st leg';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Second Round' WHERE Comp IN ('J. League Cup') AND MatchDay = 'Second Round 2nd leg';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Third Round' WHERE Comp IN ('J. League Cup') AND MatchDay = '3rd round 1st leg';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'Third Round' WHERE Comp IN ('J. League Cup') AND MatchDay = '3rd round 2nd leg';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'First Round' WHERE Comp IN ('J. League Cup') AND MatchDay = 'First Round 1st leg';
UPDATE superleague_clubs.`transfermarket_matches_kawasaki-frontale` SET MatchDay = 'First Round' WHERE Comp IN ('J. League Cup') AND MatchDay = 'First Round 2nd leg';

UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Group stage' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%Group%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Quarter-finals' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%Quarter%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Semi-finals' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%Semi%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Round of 16' WHERE Comp IN ('AFC Champions League') AND MatchDay LIKE '%last 16%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Final' WHERE Comp IN ('AFC Champions League') AND MatchDay = 'final 1st leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Final' WHERE Comp IN ('AFC Champions League') AND MatchDay = 'final 2nd leg';

UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Group stage' WHERE Comp= 'J. League Cup' AND MatchDay LIKE '%Group%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Quarter-finals' WHERE Comp= 'J. League Cup' AND MatchDay LIKE '%Quarter%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Semi-finals' WHERE Comp= 'J. League Cup' AND MatchDay LIKE '%Semi%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Round of 16' WHERE Comp IN ('J. League Cup') AND MatchDay LIKE '%last 16%';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Final' WHERE Comp IN ('J. League Cup') AND MatchDay = 'final 1st leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Final' WHERE Comp IN ('J. League Cup') AND MatchDay = 'final 2nd leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Third Round' WHERE Comp IN ('J. League Cup') AND MatchDay = '3rd round 1st leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Third Round' WHERE Comp IN ('J. League Cup') AND MatchDay = '3rd round 2nd leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Second Round' WHERE Comp IN ('J. League Cup') AND MatchDay = 'Second Round 1st leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'Second Round' WHERE Comp IN ('J. League Cup') AND MatchDay = 'Second Round 2nd leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'First Round' WHERE Comp IN ('J. League Cup') AND MatchDay = 'First Round 1st leg';
UPDATE superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` SET MatchDay = 'First Round' WHERE Comp IN ('J. League Cup') AND MatchDay = 'First Round 2nd leg';

/* Insert the rounds/ matchdays for all comps */

DROP TABLE IF EXISTS superleague_raw.`$rounds`;
CREATE TABLE superleague_raw.`$rounds` AS 
SELECT DISTINCT Matchday as round_name, season_id, season_name, l.league_name 
FROM superleague_clubs.`transfermarket_matches_kawasaki-frontale` t
JOIN Season s 
JOIN League l ON l.league_id = s.league_id AND l.league_name = t.Comp
WHERE t.Comp IN (
'Copa Libertadores de América',
'Copa Sudamericana',
'J. League Cup',
'SuperJ. League Cup'
) AND LENGTH(s.season_name) > 4;

/*
'Copa Sudamericana',
'J. League Cup',
'SuperJ. League Cup'
*/
 
SET @row_num = (SELECT MAX(round_id) FROM Rounds);
INSERT INTO Rounds (round_id, season_id, round_name)
SELECT 
@row_num := @row_num + 1 as round_id,
season_id,
round_name
FROM superleague_raw.`$rounds`;


/* Insert Teams */

DROP TABLE IF EXISTS superleague_raw.`teams`;
CREATE TABLE superleague_raw.`teams` AS 
SELECT distinct Team FROM 
(
	SELECT distinct `Hometeam` AS Team FROM superleague_clubs.`transfermarket_matches_kawasaki-frontale` 
	UNION
	SELECT distinct `Awayteam` AS Team FROM superleague_clubs.`transfermarket_matches_kawasaki-frontale`
)a;


SET @row_num = (SELECT MAX(team_id) FROM Team);
INSERT IGNORE INTO `Team` (team_id, team_name, fbref_team_name, national)
SELECT @row_num := @row_num + 1 as team_id,
Team as team_name,
NULL as fbref_team_name,
0 as national
FROM superleague_raw.`teams` t
LEFT JOIN 
    `Team` existing ON t.Team = existing.team_name
WHERE 
    existing.team_name IS NULL;

/* Update CountryID in Team for League Games */

UPDATE Team t 
JOIN superleague_clubs.`transfermarket_matches_kawasaki-frontale` am 
ON t.team_name = am.Awayteam 
AND am.Comp IN (
'J1 League',
'J. League Cup',
'Emperor''s Cup',
'Japanese Super Cup'
)
SET t.country_id = (SELECT country_id FROM Country WHERE country_name = 'Japan');

select * from Team where team_name LIKE '%Yoko%';


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

select * from superleague_clubs.`transfermarkt_players_kawasaki-frontale`;


/* Insert Player Information */ 

DROP TABLE IF EXISTS superleague_raw.`$players`;
CREATE TABLE superleague_raw.`$players` AS 
SELECT DISTINCT playername, mainposition, DATE_FORMAT(STR_TO_DATE(birthdate, '%b %d, %Y'), '%Y-%m-%d') as date_of_birth, SUBSTRING_INDEX(SUBSTRING_INDEX(player_url, '/', -1), '/', -1) AS tm_playerid
  FROM superleague_clubs.`transfermarkt_players_kawasaki-frontale`;

SELECT * FROM superleague_raw.`$players`;

SET @row_num = (SELECT MAX(player_id) FROM Player);
INSERT IGNORE INTO superleague.Player (player_id, `name`, fbref_playerid, date_of_birth, `position`, tm_playerid)
SELECT @row_num := @row_num + 1 as player_id, 
p.playername, NULL, p.date_of_birth, p.mainposition, p.tm_playerid
FROM superleague_raw.`$players` p
LEFT JOIN 
    `Player` existing ON p.tm_playerid = existing.tm_playerid
WHERE 
    existing.tm_playerid IS NULL;

SELECT * FROM superleague_raw.`$unmatched_players`;
SET @row_num = (SELECT MAX(player_id) FROM Player);
INSERT IGNORE INTO superleague.Player (player_id, `name`, fbref_playerid, date_of_birth, `position`, tm_playerid)
SELECT @row_num := @row_num + 1 as player_id, 
p.Player,
p.fbref_playerid, p.date_of_birth, p.mainposition, p.tm_playerid
FROM superleague_raw.`$unmatched_players` p
LEFT JOIN 
    `Player` existing ON p.Player = existing.name
WHERE 
    existing.fbref_playerid IS NULL AND p.playername IS NULL;

SET @row_num = (SELECT MAX(player_id) FROM Player);
INSERT IGNORE INTO superleague.Player (player_id, `name`, fbref_playerid, date_of_birth, `position`, tm_playerid)
SELECT @row_num := @row_num + 1 as player_id, 
p.playername,
p.fbref_playerid, p.date_of_birth, p.mainposition, p.tm_playerid
FROM superleague_raw.`$unmatched_players` p
LEFT JOIN 
    `Player` existing ON p.Player = existing.name
WHERE 
    existing.fbref_playerid IS NULL AND p.Player IS NULL;


/* Insert Match Data For the club */ 
SET @row_num = (SELECT MAX(match_id) FROM Matches);
INSERT INTO superleague.`Matches` (match_id, season_id, home_team_id, away_team_id, round_id, match_date, match_time, home_team_score, away_team_score, match_day, fbref_matchId)
SELECT @row_num := @row_num + 1 as match_id,
s.season_id,
t_home.team_id AS home_team_id,
t_away.team_id AS away_team_id,
r.round_id, 
DATE_FORMAT(STR_TO_DATE(m.`Date`, '%a %b %d, %Y'), '%Y-%m-%d') AS match_date,
m.`Time`,
SUBSTRING_INDEX(m.Result, ':', 1) AS HomeScore,
SUBSTRING_INDEX(m.Result, ':', -1) AS AwayScore,
DAYNAME(STR_TO_DATE(m.`Date`, '%a %b %d, %Y')) AS match_day,
'' as fbref_matchid
FROM superleague_clubs.`transfermarket_matches_kawasaki-frontale` m 
JOIN `Team` t_home ON m.HomeTeam = t_home.team_name
JOIN `Team` t_away ON m.AwayTeam = t_away.team_name
JOIN `League` l ON TRIM(l.league_name) = TRIM(m.Comp)
JOIN `Season` s ON l.league_id = s.league_id AND TRIM(s.season_name) = TRIM(m.season)
JOIN `Rounds` r ON TRIM(r.round_name) = TRIM(m.Matchday) AND r.season_id = s.season_id
WHERE m.Comp IN (
'AFC Champions League'
'J1 League',
'J. League Cup',
'Emperor''s Cup',
'Japanese Super Cup'
);



/* Insert player stats for each match */

SELECT * FROM superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` WHERE Date = 'Mar 4, 2012';
SELECT * FROM superleague_clubs.`transfermarket_playerdetails_kawasaki-frontale` WHERE tm_playerid NOT IN 
	(SELECT tm_playerid FROM Player);


SET @teamid = (SELECT team_id FROM Team WHERE team_name LIKE '%Kawasaki Front.%');
SET @row_num = (SELECT MAX(stats_id) FROM PlayerStats);
INSERT INTO PlayerStats (stats_id, match_id, player_id, goals_scored, assists, yellow_cards, red_cards, minutes_played, `position`, team_id)
SELECT @row_num := @row_num + 1 as stats_id, match_id, p.player_id, Goals, Assists, `Yellow Cards`, `Red Cards`, `Minutes`, `Pos.`, @teamid
FROM superleague_raw.`$playerstats` ps 
JOIN `Player` p ON p.tm_playerid = ps.tm_playerid;

DELETE FROM PlayerStats WHERE team_id = 1234;

/* Update Captaincy for PlayerStats */

DROP TABLE IF EXISTS superleague_raw.`captaincy`;
CREATE TABLE superleague_raw.captaincy AS 
SELECT distinct m.match_id, p.player_id
FROM superleague_clubs.`$Al-Nassr-matches` im
JOIN Matches m ON m.match_date = im.`Date`
JOIN Season s ON s.season_id = m.season_id
JOIN Rounds r ON r.round_id = m.round_id AND r.season_id = s.season_id
JOIN League l ON l.league_id = s.league_id
JOIN Player p ON im.Captain = p.name;

SET @teamid = (SELECT team_id FROM Team WHERE team_name = 'Ajax Amsterdam');
UPDATE PlayerStats ps 
JOIN superleague_raw.captaincy c ON ps.match_id = c.match_id AND ps.player_id = c.player_id
SET isCaptain = 1
WHERE ps.team_id = @teamid;


/* Update Squad Number in PlayerStats from TransferMarkt */

UPDATE PlayerStats ps 
JOIN Player p ON p.player_id = ps.player_id 
JOIN superleague_clubs.`transfermarkt_players_kawasaki-frontale` t ON t.playername = p.name 
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


