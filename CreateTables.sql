USE EduVenture;
CREATE TABLE IF NOT EXISTS Category (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    CategoryDescription TEXT,
    Grade INT,
    Image VARCHAR(255),
    NumberOfCourses INT
);

CREATE TABLE IF NOT EXISTS Course (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT,
    CourseName VARCHAR(255) NOT NULL,
    Image VARCHAR(255),
    NumberOfLessons INT,
    Rating FLOAT,
    TotalHours INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(ID) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Lesson (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CourseId INT,
    LessonName VARCHAR(255) NOT NULL,
    LessonNumber INT,
    Duration TIME,
    Video VARCHAR(255),
    Details TEXT,
    ContentOrder INT,
    Transcript TEXT,
    ContentType ENUM('video', 'article') NOT NULL,
    FOREIGN KEY (CourseId) REFERENCES Course(ID) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Quiz (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CourseId INT,
    QuizName VARCHAR(255),
    QuizNumber INT,
    ContentOrder INT,
    MinPassScore INT,
    MaxScore INT,
    FOREIGN KEY (CourseId) REFERENCES Course(ID)
);
CREATE TABLE IF NOT EXISTS QuizQuestion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    QuizId INT,
    QuestionTitle TEXT,
    QuestionType ENUM('Single', 'Multiple', 'Short Answer', 'True/False'),
    FOREIGN KEY (QuizId) REFERENCES Quiz(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS QuestionAnswer (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    QuestionId INT,
    Answer TEXT,
    IsCorrect BOOLEAN,
    FOREIGN KEY (QuestionId) REFERENCES QuizQuestion(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS QuizAttempt (
    QuizId INT,
    StudentId INT,
    CompletionDate DATE,
    Score INT,
    PRIMARY KEY (QuizId, StudentId),
    FOREIGN KEY (QuizId) REFERENCES Quiz(ID) ON DELETE CASCADE,
    FOREIGN KEY (StudentId) REFERENCES Student(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS StudentLesson (
    StudentId INT,
    LessonId INT,
    CompletionDate DATE,
    PRIMARY KEY (StudentId, LessonId),
    FOREIGN KEY (StudentId) REFERENCES Student(ID) ON DELETE CASCADE,
    FOREIGN KEY (LessonId) REFERENCES Lesson(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Enrollment (
    CourseId INT,
    StudentId INT,
    EnrollmentDate DATE,
    Progress INT DEFAULT 0,
    DueDate DATE,
    Score INT DEFAULT 0,
    PRIMARY KEY (CourseId, StudentId),
    FOREIGN KEY (CourseId) REFERENCES Course(ID) ON DELETE CASCADE,
    FOREIGN KEY (StudentId) REFERENCES Student(ID) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Certificate (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    StudentId INT,
    CourseId INT,
    IssueDate DATE,
    CertificateUrl VARCHAR(255),
    FOREIGN KEY (StudentId) REFERENCES Student(ID) ON DELETE CASCADE,
    FOREIGN KEY (CourseId) REFERENCES Course(ID) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Downloads (
    StudentId INT,
    LessonId INT,
    DownloadDate DATE,
    DownloadFileUrl VARCHAR(255),
    PRIMARY KEY (StudentId, LessonId),
    FOREIGN KEY (StudentId) REFERENCES Student(ID) ON DELETE CASCADE,
    FOREIGN KEY (LessonId) REFERENCES Lesson(ID) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Achievement (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AchievementName VARCHAR(255),
    AchievementDescription TEXT,
    Criteria TEXT
);
CREATE TABLE IF NOT EXISTS StudentAchievement (
    StudentID INT,
    AchievementID INT,
    DateAcquired DATE,
    PRIMARY KEY (StudentID, AchievementID),
    FOREIGN KEY (StudentID) REFERENCES Student(ID) ON DELETE CASCADE,
    FOREIGN KEY (AchievementID) REFERENCES Achievement(ID) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Plan (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PlanName VARCHAR(255),
    PlanDescription TEXT,
    PlanPrice FLOAT,
    PriceText VARCHAR(255),
    Feature1 TEXT,
    Feature2 TEXT,
    Feature3 TEXT
);

CREATE TABLE IF NOT EXISTS Subscription (
    PlanId INT,
    StudentId INT,
    StartDate DATE,
    EndDate DATE,
    SubscriptionStatus ENUM('active', 'inactive', 'trial'),
    PRIMARY KEY (PlanId, StudentId),
    FOREIGN KEY (PlanId) REFERENCES Plan(ID) ON DELETE CASCADE,
    FOREIGN KEY (StudentId) REFERENCES Student(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Search_logs (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    SearchTerm VARCHAR(255),
    SearchTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    Count BIGINT
);