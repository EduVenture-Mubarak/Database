USE EduVenture;
CREATE OR REPLACE VIEW CourseContentStatus AS
SELECT 
    s.ID AS StudentID,
    s.FullName AS StudentName,
    c.ID AS CourseID,
    c.CourseName,
    c.Image,
    l.ID AS ContentID,
    l.LessonName AS ContentName,
    l.ContentOrder,
    l.ContentType,
    CASE WHEN sl.LessonId IS NOT NULL AND s.ID = sl.StudentId THEN 1 ELSE 0 END AS IsCompleted
FROM Student s
CROSS JOIN Lesson l
JOIN Course c ON l.CourseId = c.ID
LEFT JOIN StudentLesson sl ON s.ID = sl.StudentId AND l.ID = sl.LessonId

UNION

SELECT 
    s.ID AS StudentID,
    s.FuLLName AS StudentName,
    c.ID AS CourseID,
    c.CourseName,
    c.Image,
    q.ID AS ContentID,
    q.QuizName AS ContentName,
    q.ContentOrder,
    'quiz' AS ContentType,
    CASE WHEN qa.QuizId IS NOT NULL AND s.ID = qa.StudentId AND qa.Score >= q.MinPassScore THEN 1 ELSE 0 END AS IsCompleted
FROM Student s
CROSS JOIN Quiz q
JOIN Course c ON q.CourseId = c.ID
LEFT JOIN QuizAttempt qa ON q.ID = qa.QuizId AND s.ID = qa.StudentId;
