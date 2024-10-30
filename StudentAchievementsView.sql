USE EduVenture;
CREATE OR REPLACE VIEW StudentAchievementsView AS
SELECT 
    a.ID AS AchievementID,
    a.AchievementName AS AchievementName,
    a.Degree AS Degree,
    sa.DateAcquired AS CompletedOn,
    sa.StudentID
FROM StudentAchievement sa
JOIN Achievement a ON sa.AchievementID = a.ID;
