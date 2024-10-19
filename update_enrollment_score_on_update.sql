DELIMITER //

CREATE TRIGGER update_enrollment_score_on_update
AFTER UPDATE ON QuizAttempt
FOR EACH ROW
BEGIN
    DECLARE total_quiz_score INT;
    DECLARE student_quiz_score INT;

    -- Calculate total max score for all quizzes in the course
    SELECT SUM(CASE WHEN MaxScore IS NOT NULL THEN MaxScore ELSE 0 END) AS total_score
    INTO total_quiz_score
    FROM Quiz
    WHERE CourseId = (
        SELECT CourseId 
        FROM Quiz 
        WHERE ID = NEW.QuizId
    );

    -- Calculate total score of the student in all quizzes for this course
    SELECT SUM(CASE WHEN Score IS NOT NULL THEN Score ELSE 0 END) AS student_score
    INTO student_quiz_score
    FROM QuizAttempt
    WHERE StudentId = NEW.StudentId
    AND QuizId IN (
        SELECT ID 
        FROM Quiz 
        WHERE CourseId = (
            SELECT CourseId 
            FROM Quiz 
            WHERE ID = NEW.QuizId
        )
    );

    -- Update the score column in Enrollment (percentage)
    UPDATE Enrollment
    SET score = (student_quiz_score / total_quiz_score) * 100
    WHERE StudentId = NEW.StudentId
    AND CourseId = (
        SELECT CourseId 
        FROM Quiz 
        WHERE ID = NEW.QuizId
    );
END //

DELIMITER ;
