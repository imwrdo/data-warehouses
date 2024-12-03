USE hurtownie;
GO

IF OBJECT_ID('vETLExam') IS NOT NULL DROP VIEW vETLExam;
GO

CREATE VIEW vETLExam AS
SELECT 
    StudentID = (SELECT StudentID FROM Student WHERE StudentNo = CAST(SUBSTRING(E.StudentID, 2, LEN(E.StudentID)) AS INT)),
    SubjectID = (SELECT SubjectID FROM Subjects WHERE SubjectNo = CAST(E.SubjectID AS INT)),
    DateID = (SELECT DateID FROM Date_ WHERE Day_ = DAY(E.Date_) AND MonthNo = MONTH(E.Date_) AND Year_ = YEAR(E.Date_)),
    ExaminatorID = CAST(SUBSTRING(E.ExaminatorID, 2, LEN(E.ExaminatorID)) AS INT),
    Grade = E.Grade
FROM dbo.Exam_grades AS E;
GO

MERGE INTO Exam AS TT
USING vETLExam AS ST
ON TT.StudentID = ST.StudentID AND TT.SubjectID = ST.SubjectID AND TT.DateID = ST.DateID AND TT.ExaminatorID = ST.ExaminatorID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentID, SubjectID, DateID, ExaminatorID, Grade)
    VALUES (ST.StudentID, ST.SubjectID, ST.DateID, ST.ExaminatorID, ST.Grade);
GO

DROP VIEW vETLExam;
