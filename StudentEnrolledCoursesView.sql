USE EduVenture;
CREATE OR REPLACE VIEW StudentEnrolledCoursesView AS
SELECT 
    e.StudentId,
    c.ID AS CourseID,
    c.CourseName,
    c.Image,
    cat.Grade,
    e.EnrollmentDate,
    e.Progress,
    e.DueDate,
    e.Score
FROM Enrollment e
JOIN Course c ON e.CourseId = c.ID
JOIN Category cat ON c.CategoryID = cat.ID;  
