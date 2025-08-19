create database IPL;
use IPL;
-- Create the Owners table
CREATE TABLE Owners (
    OwnerID INT PRIMARY KEY AUTO_INCREMENT,
    OwnerName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100)
);

-- Create the Coaches table
CREATE TABLE Coaches (
    CoachID INT PRIMARY KEY AUTO_INCREMENT,
    CoachName VARCHAR(100) NOT NULL,
    ExperienceYears INT,
    Specialization VARCHAR(50)
);

-- Create the Teams table with foreign key references
CREATE TABLE Teams (
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50),
    OwnerID INT,
    CoachID INT,
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID),
    FOREIGN KEY (CoachID) REFERENCES Coaches(CoachID)
);
CREATE TABLE Players (
    PlayerID INT PRIMARY KEY AUTO_INCREMENT,
    PlayerName VARCHAR(100) NOT NULL,
    Age INT,
    Nationality VARCHAR(50),
    Role VARCHAR(50),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);
CREATE TABLE Venues (
    VenueID INT PRIMARY KEY AUTO_INCREMENT,
    VenueName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50),
    Capacity INT
);
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY AUTO_INCREMENT,
    MatchDate DATE NOT NULL,
    Team1ID INT,
    Team2ID INT,
    VenueID INT,
    WinnerTeamID INT,
    FOREIGN KEY (Team1ID) REFERENCES Teams(TeamID),
    FOREIGN KEY (Team2ID) REFERENCES Teams(TeamID),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID),
    FOREIGN KEY (WinnerTeamID) REFERENCES Teams(TeamID)
);
CREATE TABLE IndividualScores (
    ScoreID INT PRIMARY KEY AUTO_INCREMENT,
    MatchID INT,
    PlayerID INT,
    RunsScored INT,
    BallsFaced INT,
    WicketsTaken INT,
    OversBowled DECIMAL(4,1),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);
CREATE TABLE TotalScores (
    PlayerID INT PRIMARY KEY,
    TotalRuns INT,
    TotalWickets INT,
    MatchesPlayed INT,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);
INSERT INTO Owners (OwnerID, OwnerName, ContactInfo)
VALUES
(101, 'N. Srinivasan', 'owner1@example.com'),
(102, 'Mukesh Ambani', 'owner2@example.com'),
(103, 'Manoj Badale', 'owner3@example.com'),
(104, 'Kalanithi Maran', 'owner4@example.com'),
(105, 'Vijay Mallya', 'owner5@example.com'),
(106, 'Shah Rukh Khan', 'owner6@example.com');

INSERT INTO Coaches (CoachID, CoachName, ExperienceYears, Specialization)
VALUES
(201, 'Stephen Fleming', 10, 'Batting Strategy'),
(202, 'John Wright', 15, 'Team Management'),
(203, 'Rahul Dravid', 20, 'Batting & Leadership'),
(204, 'Tom Moody', 18, 'All-Round Development'),
(205, 'Ray Jennings', 14, 'Bowling & Fielding'),
(206, 'Trevor Bayliss', 16, 'Tactical Planning');

INSERT INTO Teams (TeamID, TeamName, City, State, OwnerID, CoachID)
VALUES 
(1, 'Chennai Super Kings', 'Chennai', 'Tamil Nadu', 101, 201),
(2, 'Mumbai Indians', 'Mumbai', 'Maharashtra', 102, 202),
(3, 'Rajasthan Royals', 'Jaipur', 'Rajasthan', 103, 203),
(4, 'Sunrisers Hyderabad', 'Hyderabad', 'Telangana', 104, 204),
(5, 'Royal Challengers Bangalore', 'Bangalore', 'Karnataka', 105, 205),
(6, 'Kolkata Knight Riders', 'Kolkata', 'West Bengal', 106, 206);

INSERT INTO Players (PlayerID, PlayerName, Age, Nationality, Role, TeamID)
VALUES
-- Chennai Super Kings (CSK)
(1, 'Michael Hussey', 38, 'Australian', 'Batsman', 1),
(2, 'Suresh Raina', 26, 'Indian', 'Batsman', 1),
(3, 'MS Dhoni', 31, 'Indian', 'Wicketkeeper', 1),
(4, 'Dwayne Bravo', 30, 'West Indian', 'All-rounder', 1),
(5, 'Ravindra Jadeja', 25, 'Indian', 'All-rounder', 1),

-- Mumbai Indians (MI)
(6, 'Rohit Sharma', 26, 'Indian', 'Batsman', 2),
(7, 'Dinesh Karthik', 28, 'Indian', 'Wicketkeeper', 2),
(8, 'Kieron Pollard', 26, 'West Indian', 'All-rounder', 2),
(9, 'Mitchell Johnson', 32, 'Australian', 'Bowler', 2),
(10, 'Lasith Malinga', 30, 'Sri Lankan', 'Bowler', 2),

-- Rajasthan Royals (RR)
(11, 'Ajinkya Rahane', 25, 'Indian', 'Batsman', 3),
(12, 'Shane Watson', 31, 'Australian', 'All-rounder', 3),
(13, 'Sanju Samson', 19, 'Indian', 'Wicketkeeper', 3),
(14, 'James Faulkner', 23, 'Australian', 'Bowler', 3),
(15, 'Brad Hodge', 38, 'Australian', 'Batsman', 3),

-- Sunrisers Hyderabad (SRH)
(16, 'Shikhar Dhawan', 27, 'Indian', 'Batsman', 4),
(17, 'Cameron White', 30, 'Australian', 'Batsman', 4),
(18, 'Darren Sammy', 30, 'West Indian', 'All-rounder', 4),
(19, 'Amit Mishra', 30, 'Indian', 'Bowler', 4),
(20, 'Dale Steyn', 30, 'South African', 'Bowler', 4),

-- Royal Challengers Bangalore (RCB)
(21, 'Chris Gayle', 34, 'West Indian', 'Batsman', 5),
(22, 'Virat Kohli', 24, 'Indian', 'Batsman', 5),
(23, 'AB de Villiers', 29, 'South African', 'Batsman', 5),
(24, 'Vinay Kumar', 29, 'Indian', 'Bowler', 5),
(25, 'Murali Kartik', 37, 'Indian', 'Bowler', 5),

-- Kolkata Knight Riders (KKR)
(26, 'Gautam Gambhir', 31, 'Indian', 'Batsman', 6),
(27, 'Jacques Kallis', 37, 'South African', 'All-rounder', 6),
(28, 'Sunil Narine', 25, 'West Indian', 'Bowler', 6),
(29, 'Yusuf Pathan', 30, 'Indian', 'All-rounder', 6),
(30, 'Manvinder Bisla', 28, 'Indian', 'Wicketkeeper', 6);

INSERT INTO Venues (VenueID, VenueName, City, State, Capacity)
VALUES
(301, 'M. A. Chidambaram Stadium', 'Chennai', 'Tamil Nadu', 50000),
(302, 'Wankhede Stadium', 'Mumbai', 'Maharashtra', 33000),
(303, 'Sawai Mansingh Stadium', 'Jaipur', 'Rajasthan', 30000),
(304, 'Rajiv Gandhi International Stadium', 'Hyderabad', 'Telangana', 55000),
(305, 'M. Chinnaswamy Stadium', 'Bangalore', 'Karnataka', 40000),
(306, 'Eden Gardens', 'Kolkata', 'West Bengal', 66000);

INSERT INTO Matches (MatchID, MatchDate, Team1ID, Team2ID, VenueID, WinnerTeamID)
VALUES
(401, '2013-04-03', 1, 2, 301, 2),  -- MI vs CSK
(402, '2013-04-05', 3, 4, 302, 3),  -- RR vs SRH
(403, '2013-04-07', 5, 6, 303, 6),  -- RCB vs KKR
(404, '2013-04-09', 1, 3, 304, 1),  -- CSK vs RR
(405, '2013-04-11', 2, 4, 305, 2),  -- MI vs SRH
(406, '2013-04-13', 5, 1, 306, 5),  -- RCB vs CSK
(407, '2013-04-15', 6, 3, 301, 3),  -- KKR vs RR
(408, '2013-04-17', 2, 5, 302, 2),  -- MI vs RCB
(409, '2013-04-19', 4, 6, 303, 4),  -- SRH vs KKR
(410, '2013-05-26', 1, 2, 304, 2);  -- IPL Final (CSK vs MI) - MI won

INSERT INTO IndividualScores (ScoreID, MatchID, PlayerID, RunsScored, BallsFaced, OversBowled, WicketsTaken)
VALUES
-- Match 401 (CSK vs MI)
(501, 401, 1, 50, 38, 0, 0),  -- Michael Hussey
(502, 401, 6, 75, 49, 0, 0),  -- Rohit Sharma
(503, 401, 10, 5, 10, 4, 2),  -- Lasith Malinga
(504, 401, 3, 40, 30, 0, 0),  -- MS Dhoni
(505, 401, 9, 10, 7, 4, 1),   -- Mitchell Johnson

-- Match 402 (RR vs SRH)
(506, 402, 11, 80, 52, 0, 0),  -- Ajinkya Rahane
(507, 402, 12, 60, 40, 2, 1),  -- Shane Watson
(508, 402, 16, 45, 30, 0, 0),  -- Shikhar Dhawan
(509, 402, 19, 10, 6, 4, 2),   -- Amit Mishra
(510, 402, 14, 5, 4, 4, 3),    -- James Faulkner

-- Match 403 (RCB vs KKR)
(511, 403, 21, 90, 54, 0, 0),  -- Chris Gayle
(512, 403, 22, 70, 45, 0, 0),  -- Virat Kohli
(513, 403, 26, 50, 33, 0, 0),  -- Gautam Gambhir
(514, 403, 28, 10, 8, 4, 3),   -- Sunil Narine
(515, 403, 23, 40, 28, 0, 0),  -- AB de Villiers

-- Match 410 (IPL Final: CSK vs MI)
(516, 410, 6, 88, 52, 0, 0),   -- Rohit Sharma (Man of the Match)
(517, 410, 7, 40, 28, 0, 0),   -- Dinesh Karthik
(518, 410, 1, 60, 44, 0, 0),   -- Michael Hussey
(519, 410, 3, 45, 32, 0, 0),   -- MS Dhoni
(520, 410, 10, 5, 8, 4, 2);    -- Lasith Malinga

INSERT INTO TotalScores (PlayerID, TotalRuns, TotalWickets, MatchesPlayed)
VALUES
-- Chennai Super Kings
(1, 733, 0, 16),
(2, 548, 0, 16),
(3, 461, 0, 16),
(4, 312, 32, 16),
(5, 200, 15, 16),

-- Mumbai Indians
(6, 538, 0, 17),
(7, 510, 0, 17),
(8, 420, 10, 17),
(9, 20, 24, 17),
(10, 5, 22, 17),

-- Rajasthan Royals
(11, 560, 0, 16),
(12, 543, 13, 16),
(13, 350, 0, 16),
(14, 110, 28, 16),
(15, 285, 0, 16),

-- Sunrisers Hyderabad
(16, 475, 0, 17),
(17, 350, 0, 17),
(18, 180, 10, 17),
(19, 50, 21, 17),
(20, 10, 19, 17),

-- Royal Challengers Bangalore
(21, 708, 0, 16),
(22, 634, 0, 16),
(23, 360, 0, 16),
(24, 20, 20, 16),
(25, 5, 18, 16),

-- Kolkata Knight Riders
(26, 486, 0, 16),
(27, 311, 10, 16),
(28, 5, 24, 16),
(29, 210, 0, 16),
(30, 230, 0, 16);
select * from Owners;
select * from coaches;
select * from teams;
select *from players;
select * from venues;
select * from matches;
select * from IndividualScores;
select * from TotalScores;

-- 1.Retrieve all players who are batsmen from the Players table.
SELECT
 PlayerName,
 Age, 
 Nationality 
 FROM Players
 WHERE Role = 'Batsman';

-- 2.Find the total number of runs scored by each team.
SELECT 
T.TeamName, 
SUM(TS.TotalRuns) AS TotalRunsScored
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
JOIN Teams T ON P.TeamID = T.TeamID
GROUP BY T.TeamName
ORDER BY TotalRunsScored DESC;


-- 3.Find players who have scored more runs than the average total runs of all players.
SELECT 
PlayerName,
 TotalRuns 
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
WHERE TS.TotalRuns > (SELECT AVG(TotalRuns) FROM TotalScores);

-- 4.Retrieve match details along with the venue where each match was played.
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

-- 5.Retrieve all players along with their respective teams, even if they do not belong to any team.
SELECT 
P.PlayerName, 
P.Age, 
P.Role, 
T.TeamName 
FROM Players P
LEFT JOIN Teams T ON P.TeamID = T.TeamID;

-- 6.Find top 5 players with highest total runs.[using RANK()]
SELECT 
PlayerName,
TotalRuns, 
RANK() OVER (ORDER BY TotalRuns DESC) AS RunRank
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
LIMIT 5;

-- 7.Find top  bowler from each team .[using ROW_NUMBER()]
SELECT 
TeamName,
PlayerName, 
TotalWickets, 
ROW_NUMBER() OVER (PARTITION BY TeamName ORDER BY TotalWickets DESC) AS BowlerRank
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
JOIN Teams T ON P.TeamID = T.TeamID
WHERE TotalWickets > 0;

-- 8.Running total of runs for each player (cumulative)
SELECT 
PlayerName,
TotalRuns,
SUM(TotalRuns) OVER (ORDER BY TotalRuns DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID;

-- 9.Find average runs by role.[using CTE]
WITH RoleAvg AS (
    SELECT
    Role, 
    AVG(TotalRuns) AS AvgRuns
    FROM TotalScores TS
    JOIN Players P ON TS.PlayerID = P.PlayerID
    GROUP BY Role
)
SELECT * FROM RoleAvg;

-- 10.Player performance percentile based on runs
SELECT
PlayerName, 
TotalRuns,
round(PERCENT_RANK() OVER (ORDER BY TotalRuns DESC),2) AS Run_Percentile
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID;

-- 11.Find match count played by each team
SELECT 
T.TeamName, 
COUNT(M.MatchID) AS MatchesPlayed
FROM Teams T
JOIN Matches M ON T.TeamID = M.Team1ID OR T.TeamID = M.Team2ID
GROUP BY T.TeamName;

-- 12.Find top 3 highest run scorers from each team
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

-- 13.Find players whose strike rate (Runs/Balls) in a match > 150
SELECT
 P.PlayerName, 
 I.MatchID,
 I.RunsScored, 
 I.BallsFaced,
round((I.RunsScored / I.BallsFaced)*100,2) AS Strike_Rate
FROM IndividualScores I
JOIN Players P ON I.PlayerID = P.PlayerID
WHERE (I.RunsScored / I.BallsFaced)*100 > 150;

-- 14.Find best bowler (min economy rate = Runs conceded / Overs)
SELECT
 P.PlayerName, 
 I.MatchID,
(I.RunsScored / NULLIF(I.OversBowled,0)) AS Economy
FROM IndividualScores I
JOIN Players P ON I.PlayerID = P.PlayerID
WHERE I.OversBowled > 0
ORDER BY Economy ASC
LIMIT 5;

-- 15.CTE to calculate teamwise average runs per player
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

-- 16.Players with more than 500 runs but less than 10 wickets
SELECT PlayerName,
 TotalRuns,
 TotalWickets
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
WHERE TotalRuns > 500 AND TotalWickets < 10;

-- 17.Find top 5 youngest players by runs
SELECT
 PlayerName, 
 Age, 
 TotalRuns
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
ORDER BY Age ASC, TotalRuns DESC
LIMIT 5;

-- 18.Find players who performed best in finals (MatchID = 410)
SELECT
P.PlayerName,
I.RunsScored, 
I.WicketsTaken
FROM IndividualScores I
JOIN Players P ON I.PlayerID = P.PlayerID
WHERE I.MatchID = 410
ORDER BY I.RunsScored DESC, I.WicketsTaken DESC;

-- 19.Find teams with win percentage
SELECT T.TeamName,
       COUNT(CASE WHEN M.WinnerTeamID = T.TeamID THEN 1 END) AS Wins,
       COUNT(M.MatchID) AS Matches,
       round((COUNT(CASE WHEN M.WinnerTeamID = T.TeamID THEN 1 END) * 100.0 / COUNT(M.MatchID)),2)AS WinPercentage
FROM Teams T
JOIN Matches M ON T.TeamID = M.Team1ID OR T.TeamID = M.Team2ID
GROUP BY T.TeamName;

-- 20.Dense rank for players based on wickets
SELECT 
PlayerName,
TotalWickets,
DENSE_RANK() OVER (ORDER BY TotalWickets DESC) AS WicketRank
FROM TotalScores TS
JOIN Players P ON TS.PlayerID = P.PlayerID
WHERE TotalWickets > 0;

-- 21.Find the top 3 players who scored the most total runs.
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

-- 22.Find the average runs scored by players in each team.
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

-- 23.Find players who scored more runs than the average of their own team.
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

-- 24.Find the highest wicket-taking player from each team.
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

-- 25.Show each team’s total runs and total wickets together.
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




