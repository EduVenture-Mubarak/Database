USE EduVenture;

-- Category Table
ALTER TABLE Category
    MODIFY Name VARCHAR(255) NOT NULL,
    MODIFY Grade INT NOT NULL,
    ADD UNIQUE (Name),
    ADD INDEX (Grade);

-- Course Table
ALTER TABLE Course
    MODIFY CourseName VARCHAR(255) NOT NULL,
    MODIFY Rating FLOAT DEFAULT 0,
    MODIFY TotalHours INT DEFAULT 0,
    ADD UNIQUE (CourseName),
    ADD INDEX (CategoryID),
    ADD INDEX (Rating);

-- Lesson Table
ALTER TABLE Lesson
    MODIFY LessonName VARCHAR(255) NOT NULL,
    MODIFY LessonNumber INT NOT NULL,
    MODIFY ContentType ENUM('video', 'article') NOT NULL;

-- Quiz Table
ALTER TABLE Quiz
    MODIFY QuizName VARCHAR(255) NOT NULL,
    MODIFY QuizNumber INT NOT NULL,
    MODIFY MaxScore INT NOT NULL,
    ADD INDEX (QuizNumber);

-- QuizQuestion Table
ALTER TABLE QuizQuestion
    MODIFY QuestionTitle TEXT NOT NULL,
    MODIFY QuestionType ENUM('Single', 'Multiple', 'Short Answer', 'True/False') NOT NULL;

-- QuestionAnswer Table
ALTER TABLE QuestionAnswer
    MODIFY Answer TEXT NOT NULL,
    MODIFY IsCorrect BOOLEAN NOT NULL,
    ADD INDEX (QuestionId);

-- QuizAttempt Table
ALTER TABLE QuizAttempt
    MODIFY Score INT NOT NULL,
    ADD INDEX (QuizId);

-- Enrollment Table
ALTER TABLE Enrollment
    MODIFY EnrollmentDate DATE NOT NULL,
    MODIFY Progress INT NOT NULL DEFAULT 0,
    MODIFY DueDate DATE NOT NULL,
    MODIFY Score INT NOT NULL DEFAULT 0,
    ADD INDEX (StudentId);

-- Certificate Table
ALTER TABLE Certificate
    MODIFY IssueDate DATE NOT NULL,
    MODIFY CertificateUrl VARCHAR(255) NOT NULL;

-- Downloads Table
ALTER TABLE Downloads
    MODIFY DownloadDate DATE NOT NULL,
    MODIFY DownloadFileUrl VARCHAR(255) NOT NULL;

-- Achievement Table
ALTER TABLE Achievement
    MODIFY AchievementName VARCHAR(255) NOT NULL,
    ADD UNIQUE (AchievementName);

-- StudentAchievement Table
ALTER TABLE StudentAchievement
    MODIFY StudentID INT NOT NULL,
    MODIFY AchievementID INT NOT NULL,
    ADD INDEX (StudentID),
    ADD INDEX (AchievementID);

-- Plan Table
ALTER TABLE Plan
    MODIFY PlanName VARCHAR(255) NOT NULL,
    MODIFY PlanPrice FLOAT NOT NULL,
    MODIFY PriceText VARCHAR(255) NOT NULL,
    ADD UNIQUE (PlanName),
    ADD INDEX (PlanPrice);

-- Subscription Table
ALTER TABLE Subscription
    MODIFY StartDate DATE NOT NULL,
    MODIFY EndDate DATE NOT NULL,
    MODIFY SubscriptionStatus ENUM('active', 'inactive', 'trial') NOT NULL,
    ADD INDEX (SubscriptionStatus);

-- Search_logs Table
ALTER TABLE Search_logs
    MODIFY SearchTerm VARCHAR(255) NOT NULL,
    MODIFY SearchTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    MODIFY Count BIGINT NOT NULL DEFAULT 1,
    ADD INDEX (SearchTerm),
    ADD INDEX (Count);
