use hurtownie

CREATE TABLE Time_ (
	TimeID INT PRIMARY KEY IDENTITY,
	Hour_ INT CHECK (Hour_ BETWEEN 0 AND 23),
	Time_of_day VARCHAR(30) CHECK(Time_of_day IN (
        'między 0 a 8', 'między 9 a 12', 'między 13 a 15', 'między 16 a 20', 'między 21 a 23'
        ))
    );

CREATE TABLE Date_ (
	DateID INT PRIMARY KEY IDENTITY,
	Day_ INT NOT NULL CHECK (Day_ BETWEEN 1 AND 31),
    Year_ INT NOT NULL CHECK(ISNUMERIC(Year_)=1),
    Month_ VARCHAR(11) NOT NULL CHECK(Month_ IN (
        'Styczeń', 'Luty','Marzec', 'Kwiecień', 'Maj',
        'Czerwiec','Lipiec', 'Sierpień','Wrzesień','Październik',
        'Listopad' , 'Grudzień'
    )),
    MonthNo INT NOT NULL CHECK(MonthNo>0 AND MonthNo<13)
    );

CREATE TABLE Student(
    StudentID INT PRIMARY KEY IDENTITY,
    StudentNo INT NOT NULL CHECK (ISNUMERIC(StudentNo) = 1),
    First_name VARCHAR(20) NOT NULL CHECK (ISNUMERIC(First_name) = 0),
    Family_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(Family_name) = 0),
    Parent_number VARCHAR(11) NOT NULL CHECK (Parent_number LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'),
    Email VARCHAR(50) NOT NULL CHECK (Email LIKE '%@%.%'),
    ClassID VARCHAR(3) NOT NULL CHECK (ClassID LIKE '[A-Z]-[0-9]'),
    Year_of_graduation INT NOT NULL CHECK(Year_of_graduation LIKE '[0-9][0-9][0-9][0-9]'),
    isCurrent BIT
);

CREATE TABLE Teacher(
    TeacherID INT PRIMARY KEY IDENTITY,
    TeacherNo INT NOT NULL CHECK (ISNUMERIC(TeacherNo) = 1),
    First_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(First_name) = 0),
    Family_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(Family_name) = 0),
    Phone_number VARCHAR(11) NOT NULL CHECK (Phone_number LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')
);

CREATE TABLE Subjects(
    SubjectID INT PRIMARY KEY IDENTITY,
    SubjectNo INT NOT NULL CHECK(ISNUMERIC(SubjectNo)=1),
    Subject_name VARCHAR(30) NOT NULL CHECK (ISNUMERIC(Subject_name) = 0),
    Main_teacher INT NOT NULL CHECK (ISNUMERIC(Main_teacher) = 1),
    Year_of_actualization INT NOT NULL CHECK(Year_of_actualization>1800),
    Types_of_lessons VARCHAR(100),
    hourRange VARCHAR(20),
    Year_ INT NOT NULL CHECK(Year_>1800),
    isCurrent BIT NOT NULL
);

 -- Fact table 
CREATE TABLE Classes(
    StudentID INT FOREIGN KEY REFERENCES Student(StudentID),
    TeacherID INT FOREIGN KEY REFERENCES Teacher(TeacherID),
    SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
    DateID INT FOREIGN KEY REFERENCES Date_(DateID),
    TimeID INT FOREIGN KEY REFERENCES Time_(TimeID),
    Grade DECIMAL(1,1) CHECK(Grade >= 0 AND Grade<=6),
    PRIMARY KEY(StudentID,TeacherID,SubjectID,DateID,TimeID)
);

-- Fact table
CREATE TABLE Funding(
    SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
    DateID INT FOREIGN KEY REFERENCES Date_(DateID),

    -- DD TransactionID
    TransactionID INT NOT NULL CHECK(ISNUMERIC(TransactionID)=1),
    -- DD PartnerID
    PartnerID INT NOT NULL CHECK(ISNUMERIC(PartnerID)=1),

    Grant_amount DECIMAL NOT NULL CHECK(ISNUMERIC(Grant_amount)=1),
    PRIMARY KEY(SubjectID,DateID,TransactionID,PartnerID)
);

-- Fact table 
CREATE TABLE Exam(
    StudentID INT FOREIGN KEY REFERENCES Student(StudentID),
    SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
    DateID INT FOREIGN KEY REFERENCES Date_(DateID),

    -- DD ExaminatorID
    ExaminatorID INT NOT NULL CHECK(ISNUMERIC(ExaminatorID)=1),

    Grade DECIMAL(4,1) NOT NULL CHECK(Grade>=0 AND Grade<=100),
    PRIMARY KEY(StudentID,SubjectID,DateID,ExaminatorID)
);