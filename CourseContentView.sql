ْUSE EduVenture;
DROP VIEW IF EXISTS CourseContentView;
CREATE VIEW CourseContentView AS
SELECT 
    l.ID AS ContentID, 
    l.LessonName AS ContentName,
    l.ContentOrder,
    l.ContentType,  -- 'video' or 'article' from the Lesson table
    c.CourseName
FROM Lesson l
JOIN Course c ON l.CourseId = c.ID

UNION

SELECT 
    q.ID AS ContentID,
    q.QuizName AS ContentName,
    q.ContentOrder,
    'quiz' AS ContentType,  -- Explicitly set to 'quiz' for quizzes
    c.CourseName
FROM Quiz q
JOIN Course c ON q.CourseId = c.ID

