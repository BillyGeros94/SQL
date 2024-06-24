--WE HAVE CREATED A BIG FOOTBALL DATABASE WITH DATA FROM TRANSFERMARKT
--WE ARE GOING TO USE SQL TO EXTRACT INFORMATION, MAKE CALCULATIONS,
--DRAW CONCLUSIONS AND MAKE DESCISIONS ACCORDING TO OUR DATA

--FIRST LET'S CHECK OUR DATA

SELECT * 
FROM appearances

SELECT * 
FROM club_games

SELECT * 
FROM clubs

SELECT * 
FROM competitions

SELECT * 
FROM game_events

SELECT * 
FROM game_lineups

SELECT * 
FROM games

SELECT * 
FROM player_valuations

SELECT * 
FROM players

--FOOTBALL CLUBS AND PLAYERS 

SELECT DISTINCT name
FROM clubs

SELECT DISTINCT name
FROM players

--WE HAVE (426) FOOTBALL CLUBS AND (29,875) PLAYERS IN OUR FOOTBALL DATABASE

--INFORMATION ABOUT CHELSEA FOOTBALL CLUB

SELECT clubs.name, average_age, stadium_name, stadium_seats, players.name, country_of_citizenship, position 
FROM clubs 
JOIN players
ON clubs.club_id = players.current_club_id
WHERE current_club_name = 'Chelsea Football Club' AND players.last_season = 2023
ORDER BY players.position 

--CHELSEA'S HOME STADIUM IS (STAMFORD BRIDGE) WITH 40853 SEATS
--CHELSEA HAS A ROSTER OF (32) PLAYERS WITH AN AVERAGE AGE OF 23.6 YEARS

--THE CLUB'S RESULTS FOR THE 23/24 SEASON

SELECT name, own_goals, opponent_goals, own_manager_name, opponent_manager_name 
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
WHERE name = 'Chelsea Football Club' AND own_manager_name = 'Mauricio Pochettino'

--GOALS SCORED AND GOALS CONCEDED

SELECT name, SUM(own_goals) AS Total_Goals_Scored, SUM(opponent_goals) AS Total_Goals_Conceded
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
WHERE name = 'Chelsea Football Club' AND own_manager_name = 'Mauricio Pochettino'
GROUP BY name

--CHELSEA SCORED A TOTAL OF (107) GOALS WHICH IS A GOOD ATTACKING OUTPUT
--BUT CONCEDED (76) GOALS WHICH ALSO MEANS THEY HAS TO FIX THEIR DEFENCE

--ALL CHELSEA GAMES IN THE PREMIER LEAGUE FOR THE 22/23 SEASON

SELECT home_club_name ,home_club_goals, away_club_goals, away_club_name, home_club_formation, away_club_formation, home_club_manager_name, away_club_manager_name
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
JOIN games
ON club_games.game_id = games.game_id
WHERE clubs.name = 'Chelsea Football Club' AND own_manager_name = 'Mauricio Pochettino' AND competition_id = 'GB1' 

--HOME GAMES

SELECT home_club_name, home_club_formation, COUNT(home_club_formation)
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
JOIN games
ON club_games.game_id = games.game_id
WHERE clubs.name = 'Chelsea Football Club' AND home_club_name = 'Chelsea Football Club' AND own_manager_name = 'Mauricio Pochettino' AND competition_id = 'GB1' 
GROUP BY home_club_name, home_club_formation

SELECT home_club_name, SUM(home_club_goals)/COUNT(home_club_name) AS Average_Goals_Scored_P90
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
JOIN games
ON club_games.game_id = games.game_id
WHERE clubs.name = 'Chelsea Football Club' AND home_club_name = 'Chelsea Football Club' AND own_manager_name = 'Mauricio Pochettino' AND competition_id = 'GB1' 
GROUP BY home_club_name

SELECT home_club_name, SUM(away_club_goals)/COUNT(away_club_name) AS Average_Goals_Conceded_P90
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
JOIN games
ON club_games.game_id = games.game_id
WHERE clubs.name = 'Chelsea Football Club' AND home_club_name = 'Chelsea Football Club' AND own_manager_name = 'Mauricio Pochettino' AND competition_id = 'GB1' 
GROUP BY home_club_name

--CHELSEA USED (4-2-3-1) SYSTEM 16 TIMES AND (3-4-2-1) SYSTEM 3 TIMES 
--CHELSEA SCORED AN AVERAGE OF (2) GOALS PER HOME GAME AND CONCEDED (1)

--CHELSEA PLAYERS STATS

SELECT players.name, position, sub_position, market_value_in_eur, SUM(yellow_cards) AS Yellow_Cards, SUM(red_cards) AS Red_Cards, SUM(goals) AS Goals, SUM(assists) AS Assists, SUM(minutes_played) AS Minutes_Payed
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
JOIN games
ON club_games.game_id = games.game_id
JOIN appearances
ON club_games.game_id = appearances.game_id
join players
ON appearances.player_id = players.player_id
WHERE clubs.name = 'Chelsea Football Club' AND own_manager_name = 'Mauricio Pochettino' AND games.competition_id = 'GB1'  AND current_club_name = 'Chelsea Football Club'
GROUP BY players.name, position, sub_position, market_value_in_eur

--(COLE PALMER) WAS THE PLAYER WITH THE MOST GOALS (22) AND THE MOST ASSISTS (11)
--(CONOR GALLAGHER) WAS THE PLAYER WITH THE MOST MINUTES PLAYED (3136)
--(MOISES CAICEDO) WAS THE PLAYER WITH THE MOST YELLOW CARDS (12)
--(MALO GUSTO) AND (REECE JAMES), BOTH CHELSEA'S RIGHT BACKS, WERE THE ONLY PLAYERS WITH A RED CARD (1) 
--CHELSEA'S MOST VALUABLE PLAYER IS (COLE PALMER) WITH A VALUE OF (80000000)

--MICHAEL OLISE DATA

SELECT players.name, position, sub_position, SUM(yellow_cards) AS Yellow_Cards, SUM(red_cards) AS Red_Cards, SUM(goals) AS Goals, SUM(assists) AS Assists, SUM(minutes_played) AS Minutes_Payed
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
JOIN games
ON club_games.game_id = games.game_id
JOIN appearances
ON club_games.game_id = appearances.game_id
join players
ON appearances.player_id = players.player_id
WHERE players.name = 'Michael Olise' 
GROUP BY players.name, position, sub_position

--THROUGH OUT HIS CAREER (MICHAEL OLISE) HAS SCORED (30) PROFESSIONAL GOALS AND HAS GIVEN (48) ASSISTS
--HE ALSO HAS BEEN GIVEN (12) YELLOW CARDS AND A TOTAL OF (0) RED CARDS

--EL CLASSICO RESULTS

SELECT home_club_name ,home_club_goals, away_club_goals, away_club_name, home_club_formation, away_club_formation, home_club_manager_name, away_club_manager_name
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
JOIN games
ON club_games.game_id = games.game_id
WHERE (home_club_name = 'Real Madrid Club de Fútbol' OR home_club_name = 'Futbol Club Barcelona') AND (away_club_name = 'Real Madrid Club de Fútbol' OR away_club_name = 'Futbol Club Barcelona')

--EL CLASSICO PLAYER STATS

SELECT players.name, position, sub_position, SUM(yellow_cards) AS Yellow_Cards, SUM(red_cards) AS Red_Cards, SUM(goals) AS Goals, SUM(assists) AS Assists, SUM(minutes_played) AS Minutes_Payed
FROM clubs 
JOIN club_games
ON clubs.club_id = club_games.club_id
JOIN games
ON club_games.game_id = games.game_id
JOIN appearances
ON club_games.game_id = appearances.game_id
join players
ON appearances.player_id = players.player_id
WHERE (home_club_name = 'Real Madrid Club de Fútbol' OR home_club_name = 'Futbol Club Barcelona') AND (away_club_name = 'Real Madrid Club de Fútbol' OR away_club_name = 'Futbol Club Barcelona')
GROUP BY players.name, position, sub_position
ORDER BY Goals DESC, Assists DESC

--LIONEL MESSI IS THE BEST PLAYER IN THE HISTORY OF EL CLASSICO WITH (26) GOALS AND (8) ASSISTS
--KARIM BENZEMA HAS (24) GOALS AND (14) ASSISTS 
--CRISTIANO RONALDO HAS  (24) GOALS AND (2) ASSISTS
--LUIS SUAREZ HAS (22) GOALS AND (6) ASSISTS
--VINICIUS JUNIOR HAS (14) GOALS AND (8) ASSISTS

--TOP 5 MOST VALUABLE BUNDESLIGA PLAYERS AS OF (29-05-2024)

SELECT DISTINCT clubs.name, players.name, player_valuations.market_value_in_eur, date
FROM clubs 
JOIN player_valuations
ON clubs.club_id = player_valuations.current_club_id
join players
on players.player_id = player_valuations.player_id
WHERE clubs.domestic_competition_id = 'L1'  AND players.last_season = 2023
ORDER BY date DESC, player_valuations.market_value_in_eur DESC


--1. (FLORIAN WIRTZ) WITH A VALUATION OF (130000000)
--2. (JAMAL MUSIALA) WITH A VALUATION OF (120000000)
--3. (HARY KANE) WITH A VALUATION OF (100000000)
--4. (XAVI SIMONS) WITH A VALUATION OF (80000000)
--5. (LEROY SANE) WITH A VALUATION OF (70000000)

--*PLACEHOLDER FOR FUTURE QUERIES*