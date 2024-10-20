USE EduVenture;
CREATE OR REPLACE VIEW QuizDetailsView AS
SELECT 
    q.ID AS QuizID,
    q.QuizName,
    qq.ID AS QuestionID,
    qq.QuestionTitle,
    qq.QuestionType,
    qa.ID AS AnswerID,
    qa.Answer,
    qa.IsCorrect
FROM Quiz q
JOIN QuizQuestion qq ON q.ID = qq.QuizId
JOIN QuestionAnswer qa ON qq.ID = qa.QuestionId;
