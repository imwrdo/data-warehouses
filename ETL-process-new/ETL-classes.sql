USE hurtownie;
GO

IF OBJECT_ID('vETLClasses') IS NOT NULL DROP VIEW vETLClasses;
GO

CREATE VIEW vETLClasses AS
SELECT 
    StudentID = (SELECT StudentID FROM Student WHERE StudentNo = CAST(SUBSTRING(ST.StudentID, 2, LEN(ST.StudentID)) AS INT)),
    TeacherID = (SELECT TeacherID FROM Teacher WHERE TeacherNo = CAST(SUBSTRING(ST.TeacherID, 2, LEN(ST.TeacherID)) AS INT)),
    SubjectID = (SELECT SubjectID FROM Subjects WHERE SubjectNo = CAST(ST.SubjectID AS INT)),
    DateID = (SELECT DateID FROM Date_ WHERE Day_ = DAY(ST.Date_) AND MonthNo = MONTH(ST.Date_) AND Year_ = YEAR(ST.Date_)),
    TimeID = (SELECT TimeID FROM Time_ WHERE Hour_ = DATEPART(HOUR, GETDATE())),
    Grade = NULL -- Placeholder, as no direct grade exists
FROM dbo.Classes AS ST;
GO

MERGE INTO Classes AS TT
USING vETLClasses AS ST
ON TT.StudentID = ST.StudentID AND TT.TeacherID = ST.TeacherID AND TT.SubjectID = ST.SubjectID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentID, TeacherID, SubjectID, DateID, TimeID, Grade)
    VALUES (ST.StudentID, ST.TeacherID, ST.SubjectID, ST.DateID, ST.TimeID, ST.Grade);
GO

DROP VIEW vETLClasses;
