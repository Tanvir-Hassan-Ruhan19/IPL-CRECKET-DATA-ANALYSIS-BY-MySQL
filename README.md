
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

