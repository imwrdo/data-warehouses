CREATE TABLE Student(
    StudentID VARCHAR(7) PRIMARY KEY NOT NULL CHECK (StudentID LIKE 's[0-9][0-9][0-9][0-9][0-9][0-9]'),
    First_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(First_name) = 0),
    Family_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(Family_name) = 0),
    Parent_number VARCHAR(11) NOT NULL CHECK (Parent_number LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'),
    Email VARCHAR(50) NOT NULL CHECK (Email LIKE '%@%.%'),
    ClassID VARCHAR(3) NOT NULL CHECK (ClassID LIKE '[A-Z]-[0-9]'),
    Year_of_graduation DATE NOT NULL
);

CREATE TABLE Teacher(
    TeacherID VARCHAR(7) PRIMARY KEY NOT NULL CHECK (TeacherID LIKE 't[0-9][0-9][0-9][0-9][0-9][0-9]'),
    First_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(First_name) = 0),
    Family_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(Family_name) = 0),
    Phone_number VARCHAR(11) NOT NULL CHECK (Phone_number LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'),
);

CREATE TABLE Subjects(
    SubjectID VARCHAR(3) NOT NULL CHECK (SubjectID LIKE '[0-9][0-9][0-9]'),
    Subject_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(Subject_name) = 0),
    Main_teacher VARCHAR(7) NOT NULL CHECK (Main_teacher LIKE 't[0-9][0-9][0-9][0-9][0-9][0-9]'),
    Year_of_actualization INT NOT NULL CHECK(Year_of_actualization>1800),
    Types_of_lessons VARCHAR(100),
    Hours_ INT CHECK (Hours_ BETWEEN 0 AND 300),
    Year_ INT NOT NULL CHECK(Year_>1800),
    FOREIGN KEY (Main_teacher) REFERENCES Teacher(TeacherID) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(SubjectID)
);

CREATE TABLE Classes(
	
	ClassID VARCHAR(7) CHECK (ClassID LIKE 'c[0-9][0-9][0-9][0-9][0-9][0-9]'),
    StudentID VARCHAR(7) NOT NULL CHECK (StudentID LIKE 's[0-9][0-9][0-9][0-9][0-9][0-9]'),
    TeacherID VARCHAR(7) NOT NULL CHECK (TeacherID LIKE 't[0-9][0-9][0-9][0-9][0-9][0-9]'),
    SubjectID VARCHAR(3) NOT NULL CHECK (SubjectID LIKE '[0-9][0-9][0-9]'),
    Date_ VARCHAR(12) NOT NULL,
    Type_of_class VARCHAR(30) NOT NULL CHECK (Type_of_class IN ('Wyklad', 'Laboratorium', 'Cwiczenia', 'Projekt')),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    PRIMARY KEY(StudentID,TeacherID,SubjectID,Type_of_class)
);

CREATE TABLE Reviews(
    ReviewID VARCHAR(6) PRIMARY KEY NOT NULL CHECK (ReviewID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    StudentID VARCHAR(7) NOT NULL CHECK (StudentID LIKE 's[0-9][0-9][0-9][0-9][0-9][0-9]'),
    TeacherID VARCHAR(7) NOT NULL CHECK (TeacherID LIKE 't[0-9][0-9][0-9][0-9][0-9][0-9]'),
    SubjectID VARCHAR(3) NOT NULL CHECK (SubjectID LIKE '[0-9][0-9][0-9]'),
    Grade DECIMAL CHECK (Grade BETWEEN 0 AND 5),
    Date_ DATE NOT NULL,
    Commentary VARCHAR(1000) CHECK(ISNUMERIC(Commentary)=0 OR COMMENTARY='-'),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE Funding(
    TransactionID VARCHAR(6) PRIMARY KEY NOT NULL CHECK (TransactionID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    Partner_name VARCHAR(50) NOT NULL CHECK (ISNUMERIC(Partner_name) = 0),
    Grant_amount DECIMAL NOT NULL CHECK (Grant_amount >0),
    Date_ DATE NOT NULL,
    Purpose VARCHAR(3) NOT NULL CHECK (Purpose LIKE '[0-9][0-9][0-9]'),
    Commentary VARCHAR(1000) CHECK(ISNUMERIC(Commentary)=0),
    FOREIGN KEY(Purpose) REFERENCES Subjects(SubjectID) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE Olympiads(
    OlympiadID VARCHAR(6) PRIMARY KEY NOT NULL CHECK (OlympiadID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    StudentID VARCHAR(7) NOT NULL CHECK (StudentID LIKE 's[0-9][0-9][0-9][0-9][0-9][0-9]'),
    TeacherID VARCHAR(7) NOT NULL CHECK (TeacherID LIKE 't[0-9][0-9][0-9][0-9][0-9][0-9]'),
    SubjectID VARCHAR(3) NOT NULL CHECK (SubjectID LIKE '[0-9][0-9][0-9]'),
    Date_ DATE NOT NULL,
    Level_ INT NOT NULL CHECK (Level_ BETWEEN 0 and 5),
    Degree INT NOT NULL CHECK (Degree BETWEEN 0 and 5),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE Exam_grades(
	GradeID VARCHAR(7) CHECK (GradeID LIKE 'g[0-9][0-9][0-9][0-9][0-9][0-9]'),
    StudentID VARCHAR(7) NOT NULL CHECK (StudentID LIKE 's[0-9][0-9][0-9][0-9][0-9][0-9]'),
    SubjectID VARCHAR(3) NOT NULL CHECK (SubjectID LIKE '[0-9][0-9][0-9]'),
    ExaminatorID VARCHAR(7) NOT NULL CHECK (ExaminatorID LIKE 'e[0-9][0-9][0-9][0-9][0-9][0-9]'),
    Grade INT NOT NULL CHECK (Grade BETWEEN 0 AND 100),
    Date_ DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) ON DELETE NO ACTION ON UPDATE NO ACTION,
);

