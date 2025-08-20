
# IPL Database & Analysis Project

## Project Overview

This project demonstrates a comprehensive IPL (Indian Premier League) database management and analysis workflow using MySQL. The database captures teams, players, coaches, owners, matches, venues, and player performances. Additionally, advanced queries provide insights into player stats, team performance, and match outcomes.

**Purpose:**

- Manage IPL team, player, coach, and match data efficiently
- Analyze individual and team performance metrics
- Generate insights such as top scorers, best bowlers, match results, and win percentages

  ## SQL Queries & Outputs

### 1. Retrieve all players who are batsmen
```sql
SELECT
    PlayerName,
    Age, 
    Nationality 
FROM Players
WHERE Role = 'Batsman';
```

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
```sql
SELECT 
T.TeamName, 
SUM(TS.TotalRuns) AS TotalRunsScored
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
JOIN Teams T ON P.TeamID = T.TeamID
GROUP BY T.TeamName
ORDER BY TotalRunsScored DESC;
```

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
```sql
SELECT 
PlayerName,
 TotalRuns 
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
WHERE TS.TotalRuns > (SELECT AVG(TotalRuns) FROM TotalScores);
```

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
```sql
SELECT
 M.MatchID,
 M.MatchDate, 
 T1.TeamName AS Team1, 
 T2.TeamName AS Team2,
 V.VenueName, V.City 
FROM Matches M
INNER JOIN Teams T1 ON M.Team1ID = T1.TeamID
INNER JOIN Teams T2 ON M.Team2ID = T2.TeamID
INNER JOIN Venues V ON M.VenueID = V.VenueID;
```

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
```sql
SELECT 
P.PlayerName, 
P.Age, 
P.Role, 
T.TeamName 
FROM Players P
LEFT JOIN Teams T ON P.TeamID = T.TeamID;
```

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
```sql
SELECT 
PlayerName,
TotalRuns, 
RANK() OVER (ORDER BY TotalRuns DESC) AS RunRank
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
LIMIT 5;
```

## Output:

| PlayerName     | TotalRuns | RunRank |
| -------------- | --------- | ------- |
| Michael Hussey | 733       | 1       |
| Chris Gayle    | 708       | 2       |
| Virat Kohli    | 634       | 3       |
| Ajinkya Rahane | 560       | 4       |
| Suresh Raina   | 548       | 5       |


## 7.Find top  bowler from each team .[using ROW_NUMBER()]

```sql
SELECT 
TeamName,
PlayerName, 
TotalWickets, 
ROW_NUMBER() OVER (PARTITION BY TeamName ORDER BY TotalWickets DESC) AS BowlerRank
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
JOIN Teams T ON P.TeamID = T.TeamID
WHERE TotalWickets > 0;
```

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

```sql
SELECT 
PlayerName,
TotalRuns,
SUM(TotalRuns) OVER (ORDER BY TotalRuns DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID;
```

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
```sql
WITH RoleAvg AS (
    SELECT
    Role, 
    AVG(TotalRuns) AS AvgRuns
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    GROUP BY Role
)
SELECT * FROM RoleAvg;
```

## Output:

| Role         | AvgRuns  |
| ------------ | -------- |
| Batsman      | 516.0909 |
| Wicketkeeper | 387.7500 |
| All-rounder  | 310.8571 |
| Bowler       | 28.1250  |


## 10.Player performance percentile based on runs
```sql
SELECT
PlayerName, 
TotalRuns,
round(PERCENT_RANK() OVER (ORDER BY TotalRuns DESC),2) AS Run_Percentile
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID;
```

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


## 11.Find match count played by each team
```sql
SELECT 
T.TeamName, 
COUNT(M.MatchID) AS MatchesPlayed
FROM Teams T
JOIN Matches M ON T.TeamID = M.Team1ID OR T.TeamID = M.Team2ID
GROUP BY T.TeamName;
```
## Output:

| TeamName                    | MatchesPlayed |
| --------------------------- | ------------- |
| Chennai Super Kings         | 4             |
| Mumbai Indians              | 4             |
| Rajasthan Royals            | 3             |
| Sunrisers Hyderabad         | 3             |
| Royal Challengers Bangalore | 3             |
| Kolkata Knight Riders       | 3             |



## 12.Find top 3 highest run scorers from each team
``` sql
SELECT
TeamName, 
PlayerName, 
TotalRuns
FROM (
SELECT 
T.TeamName,
P.PlayerName, 
TS.TotalRuns,
ROW_NUMBER() OVER (PARTITION BY T.TeamName ORDER BY TS.TotalRuns DESC) AS rn
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    JOIN Teams T ON P.TeamID = T.TeamID
) x
WHERE rn <= 3;
```

## Output:

| TeamName                    | PlayerName      | TotalRuns |
| --------------------------- | --------------- | --------- |
| Chennai Super Kings         | Michael Hussey  | 733       |
| Chennai Super Kings         | Suresh Raina    | 548       |
| Chennai Super Kings         | MS Dhoni        | 461       |
| Kolkata Knight Riders       | Gautam Gambhir  | 486       |
| Kolkata Knight Riders       | Jacques Kallis  | 311       |
| Kolkata Knight Riders       | Manvinder Bisla | 230       |
| Mumbai Indians              | Rohit Sharma    | 538       |
| Mumbai Indians              | Dinesh Karthik  | 510       |
| Mumbai Indians              | Kieron Pollard  | 420       |
| Rajasthan Royals            | Ajinkya Rahane  | 560       |
| Rajasthan Royals            | Shane Watson    | 543       |
| Rajasthan Royals            | Sanju Samson    | 350       |
| Royal Challengers Bangalore | Chris Gayle     | 708       |
| Royal Challengers Bangalore | Virat Kohli     | 634       |
| Royal Challengers Bangalore | AB de Villiers  | 360       |
| Sunrisers Hyderabad         | Shikhar Dhawan  | 475       |
| Sunrisers Hyderabad         | Cameron White   | 350       |
| Sunrisers Hyderabad         | Darren Sammy    | 180       |


## 13.Find players whose strike rate (Runs/Balls) in a match > 150
```sql
SELECT
 P.PlayerName, 
 I.MatchID,
 I.RunsScored, 
 I.BallsFaced,
round((I.RunsScored / I.BallsFaced)*100,2) AS Strike_Rate
FROM IndividualScores I
JOIN Players P ON I.PlayerID = P.PlayerID
WHERE (I.RunsScored / I.BallsFaced)*100 > 150;
```
## Output:


| PlayerName     | MatchID | RunsScored | BallsFaced | Strike\_Rate |
| -------------- | ------- | ---------- | ---------- | ------------ |
| Rohit Sharma   | 401     | 75         | 49         | 153.06       |
| Ajinkya Rahane | 402     | 80         | 52         | 153.85       |
| Amit Mishra    | 402     | 10         | 6          | 166.67       |
| Chris Gayle    | 403     | 90         | 54         | 166.67       |
| Virat Kohli    | 403     | 70         | 45         | 155.56       |
| Gautam Gambhir | 403     | 50         | 33         | 151.52       |
| Rohit Sharma   | 410     | 88         | 52         | 169.23       |


## 14.Find best bowler (min economy rate = Runs conceded / Overs)
```sql
SELECT
 P.PlayerName, 
 I.MatchID,
(I.RunsScored / NULLIF(I.OversBowled,0)) AS Economy
FROM IndividualScores I
JOIN Players P ON I.PlayerID = P.PlayerID
WHERE I.OversBowled > 0
ORDER BY Economy ASC
LIMIT 5;
```
## Output:
| PlayerName       | MatchID | Economy |
| ---------------- | ------- | ------- |
| Lasith Malinga   | 401     | 1.25    |
| James Faulkner   | 402     | 1.25    |
| Lasith Malinga   | 410     | 1.25    |
| Mitchell Johnson | 401     | 2.50    |
| Amit Mishra      | 402     | 2.50    |

## 15. Calculate teamwise average runs per player[Using CTE]
```sql
WITH TeamRuns AS (
    SELECT 
    T.TeamName,
    AVG(TS.TotalRuns) AS AvgRuns
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    JOIN Teams T ON P.TeamID = T.TeamID
    GROUP BY T.TeamName
)
SELECT * FROM TeamRuns;
```

## Output:

| TeamName                    | AvgRuns |
| --------------------------- | ------- |
| Chennai Super Kings         | 450.80  |
| Mumbai Indians              | 298.60  |
| Rajasthan Royals            | 369.60  |
| Sunrisers Hyderabad         | 213.00  |
| Royal Challengers Bangalore | 345.40  |
| Kolkata Knight Riders       | 248.40  |



## 16.Players with more than 500 runs but less than 10 wickets
```sql
SELECT PlayerName,
 TotalRuns,
 TotalWickets
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
WHERE TotalRuns > 500 AND TotalWickets < 10;
```

## Output
| PlayerName     | TotalRuns | TotalWickets |
| -------------- | --------- | ------------ |
| Michael Hussey | 733       | 0            |
| Suresh Raina   | 548       | 0            |
| Rohit Sharma   | 538       | 0            |
| Dinesh Karthik | 510       | 0            |
| Ajinkya Rahane | 560       | 0            |
| Chris Gayle    | 708       | 0            |
| Virat Kohli    | 634       | 0            |

## 17.Find top 5 youngest players by runs
```sql
SELECT
 PlayerName, 
 Age, 
 TotalRuns
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
ORDER BY Age ASC, TotalRuns DESC
LIMIT 5;
```
## Output;

| PlayerName      | Age | TotalRuns |
| --------------- | --- | --------- |
| Sanju Samson    | 19  | 350       |
| James Faulkner  | 23  | 110       |
| Virat Kohli     | 24  | 634       |
| Ajinkya Rahane  | 25  | 560       |
| Ravindra Jadeja | 25  | 200       |


## 18.Find players who performed best in finals (MatchID = 410)
```sql
SELECT
P.PlayerName,
I.RunsScored, 
I.WicketsTaken
FROM IndividualScores I
JOIN Players P ON I.PlayerID = P.PlayerID
WHERE I.MatchID = 410
ORDER BY I.RunsScored DESC, I.WicketsTaken DESC;
```
## Output:

| PlayerName     | RunsScored | WicketsTaken |
| -------------- | ---------- | ------------ |
| Rohit Sharma   | 88         | 0            |
| Michael Hussey | 60         | 0            |
| MS Dhoni       | 45         | 0            |
| Dinesh Karthik | 40         | 0            |
| Lasith Malinga | 5          | 2            |

## 19.Find teams with win percentage
```sql
SELECT T.TeamName,
       COUNT(CASE WHEN M.WinnerTeamID = T.TeamID THEN 1 END) AS Wins,
       COUNT(M.MatchID) AS Matches,
       round((COUNT(CASE WHEN M.WinnerTeamID = T.TeamID THEN 1 END) * 100.0 / COUNT(M.MatchID)),2)AS WinPercentage
FROM Teams T
JOIN Matches M ON T.TeamID = M.Team1ID OR T.TeamID = M.Team2ID
GROUP BY T.TeamName;
```

## Output

| TeamName                    | Wins | Matches | WinPercentage |
| --------------------------- | ---- | ------- | ------------- |
| Chennai Super Kings         | 1    | 4       | 25.00         |
| Mumbai Indians              | 4    | 4       | 100.00        |
| Rajasthan Royals            | 2    | 3       | 66.67         |
| Sunrisers Hyderabad         | 1    | 3       | 33.33         |
| Royal Challengers Bangalore | 1    | 3       | 33.33         |
| Kolkata Knight Riders       | 1    | 3       | 33.33         |



## 20.Dense rank for players based on wickets
```sql
SELECT 
PlayerName,
TotalWickets,
DENSE_RANK() OVER (ORDER BY TotalWickets DESC) AS WicketRank
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
WHERE TotalWickets > 0;
```
## Output:

| PlayerName       | TotalWickets | WicketRank |
| ---------------- | ------------ | ---------- |
| Dwayne Bravo     | 32           | 1          |
| James Faulkner   | 28           | 2          |
| Mitchell Johnson | 24           | 3          |
| Sunil Narine     | 24           | 3          |
| Lasith Malinga   | 22           | 4          |
| Amit Mishra      | 21           | 5          |
| Vinay Kumar      | 20           | 6          |
| Dale Steyn       | 19           | 7          |
| Murali Kartik    | 18           | 8          |
| Ravindra Jadeja  | 15           | 9          |
| Shane Watson     | 13           | 10         |
| Kieron Pollard   | 10           | 11         |
| Darren Sammy     | 10           | 11         |
| Jacques Kallis   | 10           | 11         |


## 21.Find the top 3 players who scored the most total runs.
```sql
WITH PlayerRuns AS (
    SELECT 
    P.PlayerName, 
    TS.TotalRuns
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
)
SELECT PlayerName, 
TotalRuns
FROM PlayerRuns
ORDER BY TotalRuns DESC
LIMIT 3;
```
## Output:
| PlayerName     | TotalRuns |
| -------------- | --------- |
| Michael Hussey | 733       |
| Chris Gayle    | 708       |
| Virat Kohli    | 634       |


## 22.Find the average runs scored by players in each team.
```sql
WITH TeamAvgRuns AS (
    SELECT T.TeamName,
    round(AVG(TS.TotalRuns),2) AS AvgRuns
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    JOIN Teams T ON P.TeamID = T.TeamID
    GROUP BY T.TeamName
)
SELECT TeamName, AvgRuns
FROM TeamAvgRuns
ORDER BY AvgRuns DESC;
```
## Output:
| TeamName                    | AvgRuns |
| --------------------------- | ------- |
| Chennai Super Kings         | 450.80  |
| Rajasthan Royals            | 369.60  |
| Royal Challengers Bangalore | 345.40  |
| Mumbai Indians              | 298.60  |
| Kolkata Knight Riders       | 248.40  |
| Sunrisers Hyderabad         | 213.00  |



## 23.Find players who scored more runs than the average of their own team.
```sql
WITH TeamAvg AS (
    SELECT 
    T.TeamID,
    AVG(TS.TotalRuns) AS TeamAvgRuns
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    JOIN Teams T ON P.TeamID = T.TeamID
    GROUP BY T.TeamID
)
SELECT
P.PlayerName, 
TS.TotalRuns, 
T.TeamName
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
JOIN Teams T ON P.TeamID = T.TeamID
JOIN TeamAvg TA ON T.TeamID = TA.TeamID
WHERE TS.TotalRuns > TA.TeamAvgRuns;
```
## Output:

| Player Name    | Total Runs | Team Name                   |
| -------------- | ---------- | --------------------------- |
| Michael Hussey | 733        | Chennai Super Kings         |
| Suresh Raina   | 548        | Chennai Super Kings         |
| MS Dhoni       | 461        | Chennai Super Kings         |
| Rohit Sharma   | 538        | Mumbai Indians              |
| Dinesh Karthik | 510        | Mumbai Indians              |
| Kieron Pollard | 420        | Mumbai Indians              |
| Ajinkya Rahane | 560        | Rajasthan Royals            |
| Shane Watson   | 543        | Rajasthan Royals            |
| Shikhar Dhawan | 475        | Sunrisers Hyderabad         |
| Cameron White  | 350        | Sunrisers Hyderabad         |
| Chris Gayle    | 708        | Royal Challengers Bangalore |
| Virat Kohli    | 634        | Royal Challengers Bangalore |
| AB de Villiers | 360        | Royal Challengers Bangalore |
| Gautam Gambhir | 486        | Kolkata Knight Riders       |
| Jacques Kallis | 311        | Kolkata Knight Riders       |


## 24.Find the highest wicket-taking player from each team.
```sql
WITH RankedWickets AS (
    SELECT
    P.PlayerName,
    T.TeamName, 
    TS.TotalWickets,
	ROW_NUMBER() OVER (PARTITION BY T.TeamName ORDER BY TS.TotalWickets DESC) AS rnk
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    JOIN Teams T ON P.TeamID = T.TeamID
)
SELECT PlayerName, 
TeamName, TotalWickets
FROM RankedWickets
WHERE rnk = 1;
```
## Output:

| Player Name      | Team Name                   | Total Wickets |
| ---------------- | --------------------------- | ------------- |
| Dwayne Bravo     | Chennai Super Kings         | 32            |
| Sunil Narine     | Kolkata Knight Riders       | 24            |
| Mitchell Johnson | Mumbai Indians              | 24            |
| James Faulkner   | Rajasthan Royals            | 28            |
| Vinay Kumar      | Royal Challengers Bangalore | 20            |
| Amit Mishra      | Sunrisers Hyderabad         | 21            |


## 25.Show each team’s total runs and total wickets together.
```sql
WITH TeamPerformance AS (
    SELECT
    T.TeamName,
    SUM(TS.TotalRuns) AS TeamRuns, 
    SUM(TS.TotalWickets) AS TeamWickets
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    JOIN Teams T ON P.TeamID = T.TeamID
    GROUP BY T.TeamName
)
SELECT
 TeamName, 
 TeamRuns, 
TeamWickets
FROM TeamPerformance
ORDER BY TeamRuns DESC, TeamWickets DESC;
```
## Output:

| Team Name                   | Total Runs | Total Wickets |
| --------------------------- | ---------- | ------------- |
| Chennai Super Kings         | 2254       | 47            |
| Rajasthan Royals            | 1848       | 41            |
| Royal Challengers Bangalore | 1727       | 38            |
| Mumbai Indians              | 1493       | 56            |
| Kolkata Knight Riders       | 1242       | 34            |
| Sunrisers Hyderabad         | 1065       | 50            |

