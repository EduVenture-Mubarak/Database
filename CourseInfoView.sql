USE EduVenture;
CREATE OR REPLACE VIEW CourseInfoView AS
SELECT 
    c.ID AS CourseID,
    c.CourseName,
    c.Image,
    cat.Grade,
    cat.ID AS CategoryID
FROM Course c
JOIN Category cat ON c.CategoryID = cat.ID;
