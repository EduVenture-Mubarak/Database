## EduVenture Schema Documentation

This README explains the purpose of the key views in the **EduVenture** database and highlights the important columns in each view for ease of understanding and querying.

---

### 1. **CourseContentView**
**Purpose**: This view combines both lesson and quiz content within a course, making it easier to query all types of content in a single place.

#### Key Columns:
- **ContentID**: Unique identifier for the content, whether it's a lesson or quiz.
- **ContentName**: Name of the content (either the lesson or quiz name).
- **ContentOrder**: Specifies the order in which content appears within the course.
- **ContentType**: Indicates whether the content is a 'video', 'article', or 'quiz'.
- **CourseName**: The name of the course the content belongs to.

---

### 2. **CourseContentStatus**
**Purpose**: This view tracks the completion status of lessons and quizzes for each student.

#### Key Columns:
- **StudentID**: Unique identifier for each student.
- **StudentName**: Full name of the student.
- **CourseID**: Unique identifier for each course.
- **CourseName**: Name of the course.
- **ContentID**: Unique identifier for the content (either a lesson or quiz).
- **ContentName**: Name of the content (lesson or quiz).
- **ContentOrder**: Order of the content within the course.
- **ContentType**: Specifies if the content is a 'video', 'article', or 'quiz'.
- **IsCompleted**: Indicates whether the student has completed the content (1 for completed, 0 for not completed).

---

### 3. **StudentEnrolledCoursesView**
**Purpose**: Displays information about the courses in which students are enrolled, including their progress and scores.

#### Key Columns:
- **StudentID**: Unique identifier for each student.
- **CourseID**: Unique identifier for each course.
- **CourseName**: Name of the course.
- **Image**: Image associated with the course.
- **Grade**: Grade or category of the course.
- **EnrollmentDate**: Date the student enrolled in the course.
- **Progress**: Student's progress in the course (as a percentage).
- **DueDate**: Deadline for course completion, if applicable.
- **Score**: The student's score in the course.

---

### 4. **CourseInfoView**
**Purpose**: Provides detailed information about each course.

#### Key Columns:
- **CourseID**: Unique identifier for the course.
- **CourseName**: Name of the course.
- **CategoryID**: Identifier linking the course to a category or grade.
- **Image**: Image associated with the course.
- **Grade**: Grade or category of the course.

---

### 5. **StudentAchievementsView**
**Purpose**: Tracks achievement earned by students during their enrolled courses.

#### Key Columns:
- **StudentID**: Unique identifier for the student.
- **AchievementID**: Unique identifier for each achievement or award.
- **AchievementName**: Name of the achievement or award.
- **CompletedOn**: Date when the student received the achievement.

---

### 6. **QuizDetailsView**
**Purpose**: Provides detailed information about quizzes, including quiz names, quiz questions, and answers to these questions.

#### Key Columns:
- **QuizID**: Unique identifier for the quiz.
- **QuizName**: Name of the quiz.
- **QuestionID**: Unique identifier for the quiz question.
- **QuestionTitle**: Description of the question.
- **QuestionType**: Multiple, single choice, Short Answer or True/False.
- **AnswerID**: Unique identifier for possible questions answer.
- **Answer**: Answer's content.
- **IsCorrect**: Boolean indicating if the answer is correct or not.

---

This documentation outlines the purpose of each view and highlights the most important columns to facilitate efficient querying and analysis of the EduVenture database.
