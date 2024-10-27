CREATE TABLE Student(
    StudentID VARCHAR(7) NOT NULL CHECK (StudentID LIKE 's[0-9][0-9][0-9][0-9][0-9][0-9]'),
    First_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(First_name) = 0),
    Family_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(Family_name) = 0),
    Parent_number VARCHAR(11) NOT NULL CHECK (Parent_number LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'),
    Email VARCHAR(50) NOT NULL CHECK (Email LIKE '%@%.%'),
    ClassID VARCHAR(3) NOT NULL CHECK (ClassID LIKE '[0-9]-[A-Z]'),
    Year_of_graduation DATE NOT NULL
);

CREATE TABLE Classes(
    StudentID
    TeacherID
    SubjectID
    Date_
    Type_of_class
);


CREATE TABLE Teachers(
    TeacherID
    First_name
    Family_name
    Phone_number
    Subjects
);


CREATE TABLE Subjects(
    SubjectID
    Subject_name
    Main_teacher
    Year_of_actualization
    Types_of_lessons
    Hours_
    Year_
);


CREATE TABLE Reviews(
    ReviewID
    StudentID
    TeacherID
    SubjectID
    Grade
    Date_
    Commentary
);


CREATE TABLE Funding(
    TransactionID
    Partner_name
    Grant_amount
    Date_
    Purporse
);


CREATE TABLE Olympiads(
    OlympiadID
    SubjectID
    Date_
    Level_
    Degree
    TeacherID
    StudentID
);


CREATE TABLE Exam_grades(
    StudentID
    SubjectID
    ExaminatorID
    Grade
    Date_
);

