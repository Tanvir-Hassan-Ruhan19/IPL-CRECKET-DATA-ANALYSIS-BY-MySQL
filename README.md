
# IPL Database & Analysis Project

## Project Overview

This project demonstrates a comprehensive IPL (Indian Premier League) database management and analysis workflow using MySQL. The database captures teams, players, coaches, owners, matches, venues, and player performances. Additionally, advanced queries provide insights into player stats, team performance, and match outcomes.

**Purpose:**

- Manage IPL team, player, coach, and match data efficiently
- Analyze individual and team performance metrics
- Generate insights such as top scorers, best bowlers, match results, and win percentages

  ## SQL Queries & Outputs

### 1. Retrieve all players who are batsmen
``SELECT
    PlayerName,
    Age, 
    Nationality 
FROM Players
WHERE Role = 'Batsman';``

## output:

| PlayerName     | Age | Nationality   |
| -------------- | --- | ------------- |
| Michael Hussey | 38  | Australian    |
| Suresh Raina   | 26  | Indian        |
| Rohit Sharma   | 26  | Indian        |
| Ajinkya Rahane | 25  | Indian        |
| Brad Hodge     | 38  | Australian    |
| Shikhar Dhawan | 27  | Indian        |
| Cameron White  | 30  | Australian    |
| Chris Gayle    | 34  | West Indian   |
| Virat Kohli    | 24  | Indian        |
| AB de Villiers | 29  | South African |
| Gautam Gambhir | 31  | Indian        |


## 2.Find the total number of runs scored by each team.
``SELECT 
T.TeamName, 
SUM(TS.TotalRuns) AS TotalRunsScored
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
JOIN Teams T ON P.TeamID = T.TeamID
GROUP BY T.TeamName
ORDER BY TotalRunsScored DESC;``

## Output:
| TeamName                    | TotalRunsScored |
| --------------------------- | --------------- |
| Chennai Super Kings         | 2254            |
| Rajasthan Royals            | 1848            |
| Royal Challengers Bangalore | 1727            |
| Mumbai Indians              | 1493            |
| Kolkata Knight Riders       | 1242            |
| Sunrisers Hyderabad         | 1065            |


## 3.Find players who have scored more runs than the average total runs of all players.
``SELECT 
PlayerName,
 TotalRuns 
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
WHERE TS.TotalRuns > (SELECT AVG(TotalRuns) FROM TotalScores);``

## Output:

| PlayerName     | TotalRuns |
| -------------- | --------- |
| Michael Hussey | 733       |
| Suresh Raina   | 548       |
| MS Dhoni       | 461       |
| Rohit Sharma   | 538       |
| Dinesh Karthik | 510       |
| Kieron Pollard | 420       |
| Ajinkya Rahane | 560       |
| Shane Watson   | 543       |
| Sanju Samson   | 350       |
| Shikhar Dhawan | 475       |
| Cameron White  | 350       |
| Chris Gayle    | 708       |
| Virat Kohli    | 634       |
| AB de Villiers | 360       |
| Gautam Gambhir | 486       |


## 4.Retrieve match details along with the venue where each match was played.
## CODE:
``SELECT
 M.MatchID,
 M.MatchDate, 
 T1.TeamName AS Team1, 
 T2.TeamName AS Team2,
 V.VenueName, V.City 
FROM Matches M
INNER JOIN Teams T1 ON M.Team1ID = T1.TeamID
INNER JOIN Teams T2 ON M.Team2ID = T2.TeamID
INNER JOIN Venues V ON M.VenueID = V.VenueID;``

## Output:
| MatchID | MatchDate  | Team1                       | Team2                       | VenueName                          | City      |
| ------- | ---------- | --------------------------- | --------------------------- | ---------------------------------- | --------- |
| 401     | 2013-04-03 | Chennai Super Kings         | Mumbai Indians              | M. A. Chidambaram Stadium          | Chennai   |
| 404     | 2013-04-09 | Chennai Super Kings         | Rajasthan Royals            | Rajiv Gandhi International Stadium | Hyderabad |
| 410     | 2013-05-26 | Chennai Super Kings         | Mumbai Indians              | Rajiv Gandhi International Stadium | Hyderabad |
| 405     | 2013-04-11 | Mumbai Indians              | Sunrisers Hyderabad         | M. Chinnaswamy Stadium             | Bangalore |
| 408     | 2013-04-17 | Mumbai Indians              | Royal Challengers Bangalore | Wankhede Stadium                   | Mumbai    |
| 402     | 2013-04-05 | Rajasthan Royals            | Sunrisers Hyderabad         | Wankhede Stadium                   | Mumbai    |
| 409     | 2013-04-19 | Sunrisers Hyderabad         | Kolkata Knight Riders       | Sawai Mansingh Stadium             | Jaipur    |
| 403     | 2013-04-07 | Royal Challengers Bangalore | Kolkata Knight Riders       | Sawai Mansingh Stadium             | Jaipur    |
| 406     | 2013-04-13 | Royal Challengers Bangalore | Chennai Super Kings         | Eden Gardens                       | Kolkata   |
| 407     | 2013-04-15 | Kolkata Knight Riders       | Rajasthan Royals            | M. A. Chidambaram Stadium          | Chennai   |


## 5.Retrieve all players along with their respective teams, even if they do not belong to any team.
## Code:
``SELECT 
P.PlayerName, 
P.Age, 
P.Role, 
T.TeamName 
FROM Players P
LEFT JOIN Teams T ON P.TeamID = T.TeamID;``

## Output:

| PlayerName       | Age | Role         | TeamName                    |
| ---------------- | --- | ------------ | --------------------------- |
| Michael Hussey   | 38  | Batsman      | Chennai Super Kings         |
| Suresh Raina     | 26  | Batsman      | Chennai Super Kings         |
| MS Dhoni         | 31  | Wicketkeeper | Chennai Super Kings         |
| Dwayne Bravo     | 30  | All-rounder  | Chennai Super Kings         |
| Ravindra Jadeja  | 25  | All-rounder  | Chennai Super Kings         |
| Rohit Sharma     | 26  | Batsman      | Mumbai Indians              |
| Dinesh Karthik   | 28  | Wicketkeeper | Mumbai Indians              |
| Kieron Pollard   | 26  | All-rounder  | Mumbai Indians              |
| Mitchell Johnson | 32  | Bowler       | Mumbai Indians              |
| Lasith Malinga   | 30  | Bowler       | Mumbai Indians              |
| Ajinkya Rahane   | 25  | Batsman      | Rajasthan Royals            |
| Shane Watson     | 31  | All-rounder  | Rajasthan Royals            |
| Sanju Samson     | 19  | Wicketkeeper | Rajasthan Royals            |
| James Faulkner   | 23  | Bowler       | Rajasthan Royals            |
| Brad Hodge       | 38  | Batsman      | Rajasthan Royals            |
| Shikhar Dhawan   | 27  | Batsman      | Sunrisers Hyderabad         |
| Cameron White    | 30  | Batsman      | Sunrisers Hyderabad         |
| Darren Sammy     | 30  | All-rounder  | Sunrisers Hyderabad         |
| Amit Mishra      | 30  | Bowler       | Sunrisers Hyderabad         |
| Dale Steyn       | 30  | Bowler       | Sunrisers Hyderabad         |
| Chris Gayle      | 34  | Batsman      | Royal Challengers Bangalore |
| Virat Kohli      | 24  | Batsman      | Royal Challengers Bangalore |
| AB de Villiers   | 29  | Batsman      | Royal Challengers Bangalore |
| Vinay Kumar      | 29  | Bowler       | Royal Challengers Bangalore |
| Murali Kartik    | 37  | Bowler       | Royal Challengers Bangalore |
| Gautam Gambhir   | 31  | Batsman      | Kolkata Knight Riders       |
| Jacques Kallis   | 37  | All-rounder  | Kolkata Knight Riders       |
| Sunil Narine     | 25  | Bowler       | Kolkata Knight Riders       |
| Yusuf Pathan     | 30  | All-rounder  | Kolkata Knight Riders       |
| Manvinder Bisla  | 28  | Wicketkeeper | Kolkata Knight Riders       |

## 6.Find top 5 players with highest total runs.[using RANK()]
## Code:
``SELECT 
PlayerName,
TotalRuns, 
RANK() OVER (ORDER BY TotalRuns DESC) AS RunRank
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
LIMIT 5;``

## Output:

| PlayerName     | TotalRuns | RunRank |
| -------------- | --------- | ------- |
| Michael Hussey | 733       | 1       |
| Chris Gayle    | 708       | 2       |
| Virat Kohli    | 634       | 3       |
| Ajinkya Rahane | 560       | 4       |
| Suresh Raina   | 548       | 5       |


## 7.Find top  bowler from each team .[using ROW_NUMBER()]
## Code:
``SELECT 
TeamName,
PlayerName, 
TotalWickets, 
ROW_NUMBER() OVER (PARTITION BY TeamName ORDER BY TotalWickets DESC) AS BowlerRank
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
JOIN Teams T ON P.TeamID = T.TeamID
WHERE TotalWickets > 0;``

## Output:

| TeamName                    | PlayerName       | TotalWickets | BowlerRank |
| --------------------------- | ---------------- | ------------ | ---------- |
| Chennai Super Kings         | Dwayne Bravo     | 32           | 1          |
| Chennai Super Kings         | Ravindra Jadeja  | 15           | 2          |
| Kolkata Knight Riders       | Sunil Narine     | 24           | 1          |
| Kolkata Knight Riders       | Jacques Kallis   | 10           | 2          |
| Mumbai Indians              | Mitchell Johnson | 24           | 1          |
| Mumbai Indians              | Lasith Malinga   | 22           | 2          |
| Mumbai Indians              | Kieron Pollard   | 10           | 3          |
| Rajasthan Royals            | James Faulkner   | 28           | 1          |
| Rajasthan Royals            | Shane Watson     | 13           | 2          |
| Royal Challengers Bangalore | Vinay Kumar      | 20           | 1          |
| Royal Challengers Bangalore | Murali Kartik    | 18           | 2          |
| Sunrisers Hyderabad         | Amit Mishra      | 21           | 1          |
| Sunrisers Hyderabad         | Dale Steyn       | 19           | 2          |
| Sunrisers Hyderabad         | Darren Sammy     | 10           | 3          |

## 8.Running total of runs for each player (cumulative)
## Code:
``SELECT 
PlayerName,
TotalRuns,
SUM(TotalRuns) OVER (ORDER BY TotalRuns DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID;``

## Output:

| PlayerName       | TotalRuns | RunningTotal |
| ---------------- | --------- | ------------ |
| Michael Hussey   | 733       | 733          |
| Chris Gayle      | 708       | 1441         |
| Virat Kohli      | 634       | 2075         |
| Ajinkya Rahane   | 560       | 2635         |
| Suresh Raina     | 548       | 3183         |
| Shane Watson     | 543       | 3726         |
| Rohit Sharma     | 538       | 4264         |
| Dinesh Karthik   | 510       | 4774         |
| Gautam Gambhir   | 486       | 5260         |
| Shikhar Dhawan   | 475       | 5735         |
| MS Dhoni         | 461       | 6196         |
| Kieron Pollard   | 420       | 6616         |
| AB de Villiers   | 360       | 6976         |
| Sanju Samson     | 350       | 7326         |
| Cameron White    | 350       | 7676         |
| Dwayne Bravo     | 312       | 7988         |
| Jacques Kallis   | 311       | 8299         |
| Brad Hodge       | 285       | 8584         |
| Manvinder Bisla  | 230       | 8814         |
| Yusuf Pathan     | 210       | 9024         |
| Ravindra Jadeja  | 200       | 9224         |
| Darren Sammy     | 180       | 9404         |
| James Faulkner   | 110       | 9514         |
| Amit Mishra      | 50        | 9564         |
| Mitchell Johnson | 20        | 9584         |
| Vinay Kumar      | 20        | 9604         |
| Dale Steyn       | 10        | 9614         |
| Lasith Malinga   | 5         | 9619         |
| Murali Kartik    | 5         | 9624         |
| Sunil Narine     | 5         | 9629         |


## 9.Find average runs by role.[using CTE]
## Code:
``WITH RoleAvg AS (
    SELECT
    Role, 
    AVG(TotalRuns) AS AvgRuns
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    GROUP BY Role
)
SELECT * FROM RoleAvg;``

## Output:

| Role         | AvgRuns  |
| ------------ | -------- |
| Batsman      | 516.0909 |
| Wicketkeeper | 387.7500 |
| All-rounder  | 310.8571 |
| Bowler       | 28.1250  |


## 10.Player performance percentile based on runs
## Code:
``SELECT
PlayerName, 
TotalRuns,
round(PERCENT_RANK() OVER (ORDER BY TotalRuns DESC),2) AS Run_Percentile
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID;``

## Output:

| PlayerName       | TotalRuns | Run\_Percentile |
| ---------------- | --------- | --------------- |
| Michael Hussey   | 733       | 0.00            |
| Chris Gayle      | 708       | 0.03            |
| Virat Kohli      | 634       | 0.07            |
| Ajinkya Rahane   | 560       | 0.10            |
| Suresh Raina     | 548       | 0.14            |
| Shane Watson     | 543       | 0.17            |
| Rohit Sharma     | 538       | 0.21            |
| Dinesh Karthik   | 510       | 0.24            |
| Gautam Gambhir   | 486       | 0.28            |
| Shikhar Dhawan   | 475       | 0.31            |
| MS Dhoni         | 461       | 0.34            |
| Kieron Pollard   | 420       | 0.38            |
| AB de Villiers   | 360       | 0.41            |
| Sanju Samson     | 350       | 0.45            |
| Cameron White    | 350       | 0.45            |
| Dwayne Bravo     | 312       | 0.52            |
| Jacques Kallis   | 311       | 0.55            |
| Brad Hodge       | 285       | 0.59            |
| Manvinder Bisla  | 230       | 0.62            |
| Yusuf Pathan     | 210       | 0.66            |
| Ravindra Jadeja  | 200       | 0.69            |
| Darren Sammy     | 180       | 0.72            |
| James Faulkner   | 110       | 0.76            |
| Amit Mishra      | 50        | 0.79            |
| Mitchell Johnson | 20        | 0.83            |
| Vinay Kumar      | 20        | 0.83            |
| Dale Steyn       | 10        | 0.90            |
| Lasith Malinga   | 5         | 0.93            |
| Murali Kartik    | 5         | 0.93            |
| Sunil Narine     | 5         | 0.93            |








