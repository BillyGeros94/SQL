-- We are a football scout and have created a database with player data for the needs of our club
-- We will querry through that database to find the best options for our needs

-- First let's get glimpse of the data

SELECT *
FROM scout_dataset

-- The club has asked as to identify a Right Wing Back within our budget who:
-- Is fast and cover long distances(good pace, sprints per 90).
-- Strong defensively (tackles won, interceptions, pressing success rate).
-- Has good attacking output (crossing accuracy, assists, dribbles, key passes).

-- Key Metrics:
-- Distance_km: Total distance covered per game, Sprints_90: To gauge speed and work rate,
-- Cr_A (Crosses attempted), Cr_C (Crosses completed): Crossing ability, Ast: Assists, Drb: Dribbles completed, K_Pas: Key passes for playmaking.

SELECT Name, Nat, Club, League, Position, Age, Preferred_foot, Height, Starts, Mins, Distance_km, Sprints_90, 
       Cr_A, Cr_C, (Cr_C * 100/ Cr_A) AS Crossing_Accuracy, Ast, Drb, K_Pas, Transfer_Value, Wage_per_week
FROM scout_dataset
WHERE Position = 'WBR' 
  AND Age BETWEEN 18 AND 25
  AND Wage_per_week <= 15000
  AND Cr_A <> 0
ORDER BY Crossing_Accuracy DESC, Sprints_90 DESC, Distance_km DESC, Ast DESC, Drb DESC, K_Pas DESC


-- We also need 2 Centre Backs with:
-- Height over 6ft.
-- Dominance in aerial duels (headers won).
-- Defensive solidity (Many tackles won, blocks, and interceptions).
-- Good with the ball (High passing completion and progressive passes).

--Key Metrics:
-- Height: Filter for players over 6ft, Hdrs: Headers won, Tck_W: Tackles won, Blk: Blocks, Itc: Interceptions,
-- Pas_Completion_rate: High passing accuracy, Pro_Passes: Progressive passes.

SELECT Name, Nat, Club, League, Position, Age, Preferred_foot, Height, Starts, Mins, 
       Hdrs, Tck_W, Blk, Itc, Pas_Completion_rate, Pro_Passes, Transfer_Value, Wage_per_week
FROM scout_Dataset
WHERE Position = 'DC' 
  AND Age BETWEEN 18 AND 25
  AND Height >= 6
  AND Wage_per_week <= 15000
ORDER BY Hdrs DESC, Tck_W DESC, Blk DESC, Itc DESC, Pas_Completion_rate DESC, Pro_Passes DESC


-- Next for the Defensive Midfielder, we're looking for a player who:
-- Covers large spaces (distance covered, sprints per 90).
-- Excels at tackles, interceptions, and pressing.
-- Has good passing ability to build play.

-- Key Metrics:
-- Distance_km, Sprints_90: For covering large spaces and work rate, Tck_W, Itc, Pres_A: Defensive metrics, 
-- Pas_Completion_rate, Pro_Passes: Passing ability.

SELECT Name, Nat, Club, League, Position, Age, Preferred_foot, Height, Starts, Mins, 
       Distance_km, Sprints_90, Tck_W, Itc, Pres_A, Pas_Completion_rate, Pro_Passes, Transfer_Value, Wage_per_week
FROM scout_Dataset
WHERE Position = 'DM'
  AND Height > 5.5
  AND Age BETWEEN 18 AND 25
  AND Wage_per_week <= 15000
ORDER BY Distance_km DESC, Tck_W DESC, Sprints_90 DESC, Itc DESC, Pas_Completion_rate DESC, Pres_A DESC

-- For the Central Midfielder, we want a risk-taker who:
-- Is a creative playmaker with good passing and build-up play.
-- Contributes attacking output and isn’t afraid to play vertical passes.

-- Key Metrics:
-- Pas_Completion_rate: Lower priority as we’re focused on creative risk, Pro_Passes, K_Pas: Key passes and progressive passes,
-- Ast, Gls, xG, xA: Attacking contributions.

SELECT Name, Nat, Club, League, Position, Age, Preferred_foot, Height, Starts, Mins, 
       Pas_Completion_rate, Pro_Passes, K_Pas, Ast, Gls, xG, xA, Transfer_Value, Wage_per_week
FROM scout_Dataset
WHERE Position = 'CM'
  AND Age BETWEEN 18 AND 25
  AND Wage_per_week <= 15000
ORDER BY Pro_Passes DESC, K_Pas DESC, Ast DESC, xA DESC, Gls DESC, Pas_Completion_rate ASC

-- We also need a Winger who:
-- Is a goal scorer (good finishing and xG).
-- Can dribble and create chances (key passes, dribbles).

-- Key Metrics:
-- Drb: Dribbles completed, Gls, xG: Goals and expected goals for finishing ability, K_Pas, 
-- Ast, xA: Key passes, assists, and expected assists for creativity.

SELECT Name, Nat, Club, League, Position, Age, Preferred_foot, Height, Starts, Mins, 
       Gls, Drb, K_Pas, Ast, xG, xA, Transfer_Value, Wage_per_week
FROM scout_Dataset
WHERE Position = 'AML' 
  OR Position = 'AMR'
  AND Age BETWEEN 18 AND 25
  AND Wage_per_week <= 15000
ORDER BY Gls DESC, xG DESC, Ast DESC, xA DESC, Drb DESC

-- Lastly for the forward, we need a player who:
-- Has good playmaking ability (assists, key passes) but can also score goals.
-- Can press and contribute to the build-up.

-- Key Metrics:
-- Pres_A: Pressing success rate, K_Pas, Ast, xA: Key passes and assists for playmaking, Gls, 
-- xG: Goals and expected goals for finishing, Drb: Dribbling for ball control.

SELECT Name, Nat, Club, League, Position, Age, Preferred_foot, Height, Starts, Mins, 
       Pres_A, K_Pas, Ast, xA, Gls, xG, Drb, Transfer_Value, Wage_per_week
FROM scout_dataset
WHERE Position = 'ST'
  AND Age BETWEEN 18 AND 25
  AND Wage_per_week <= 15000
ORDER BY Gls DESC, xG DESC, Drb DESC, K_Pas DESC, Pres_A DESC, xA DESC

-- By defining clear criteria for each position—including attributes such as age, financial constraints, and key performance metrics
-- we crafted targeted SQL queries to filter through a dataset of players. 
-- Our methodology emphasized essential skills such as speed, dribbling, defensive capabilities, and playmaking potential, 
-- allowing us to compile a list of candidates who not only fit within our budgetary limits but also aligned with our tactical philosophy.
