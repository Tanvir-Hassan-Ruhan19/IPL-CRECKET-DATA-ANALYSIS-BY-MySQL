
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

##output:

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

# Output:
| TeamName                    | TotalRunsScored |
| --------------------------- | --------------- |
| Chennai Super Kings         | 2254            |
| Rajasthan Royals            | 1848            |
| Royal Challengers Bangalore | 1727            |
| Mumbai Indians              | 1493            |
| Kolkata Knight Riders       | 1242            |
| Sunrisers Hyderabad         | 1065            |


