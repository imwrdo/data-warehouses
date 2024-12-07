USE hurtownie;
GO

IF OBJECT_ID('vETLClasses','V') IS NOT NULL DROP VIEW vETLClasses;
GO
IF OBJECT_ID('GradeMapping','V') IS NOT NULL DROP TABLE GradeMapping;

CREATE TABLE GradeMapping (
    StudentID INT NOT NULL,
    TeacherID INT NOT NULL,
    SubjectID INT NOT NULL,
    DateID INT NOT NULL,
    TimeID INT NOT NULL,
    Grade DECIMAL(2,1)
);
GO

BULK insert GradeMapping
	FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\ETL-process-new\grades.csv' with
	(
    FIELDTERMINATOR = ',',             -- Comma delimiter
    ROWTERMINATOR = '\n',              -- New line for rows
    FIRSTROW = 1                      -- Skipping the header row
)
 go 

CREATE VIEW vETLClasses AS
SELECT 
    StudentID = (SELECT StudentID FROM Student WHERE StudentNo = CAST(SUBSTRING(ST.StudentID, 2, LEN(ST.StudentID)-1) AS INT)),
    TeacherID = (SELECT TeacherID FROM Teacher WHERE TeacherNo = CAST(SUBSTRING(ST.TeacherID, 2, LEN(ST.TeacherID)-1) AS INT)),
    SubjectID = (SELECT SubjectID FROM Subjects WHERE SubjectNo = CAST(ST.SubjectID AS INT)),
    DateID = (SELECT DateID FROM GradeMapping
	WHERE CAST(SUBSTRING(ST.StudentID, 2, LEN(ST.StudentID)-1) AS INT) = GradeMapping.StudentID AND CAST(SUBSTRING(ST.TeacherID, 2, LEN(ST.TeacherID)-1) AS INT) = GradeMapping.TeacherID AND CAST(ST.SubjectID AS INT) = GradeMapping.SubjectID),
    TimeID = (SELECT TimeID FROM GradeMapping 
	WHERE CAST(SUBSTRING(ST.StudentID, 2, LEN(ST.StudentID)-1) AS INT) = GradeMapping.StudentID AND CAST(SUBSTRING(ST.TeacherID, 2, LEN(ST.TeacherID)-1) AS INT) = GradeMapping.TeacherID AND CAST(ST.SubjectID AS INT) = GradeMapping.SubjectID),
    Grade = (SELECT Grade FROM GradeMapping 
	WHERE CAST(SUBSTRING(ST.StudentID, 2, LEN(ST.StudentID)-1) AS INT) = GradeMapping.StudentID AND CAST(SUBSTRING(ST.TeacherID, 2, LEN(ST.TeacherID)-1) AS INT) = GradeMapping.TeacherID AND CAST(ST.SubjectID AS INT) = GradeMapping.SubjectID)
FROM LiderDB.dbo.Classes AS ST;
GO



MERGE INTO Classes AS TT
USING vETLClasses AS ST
ON TT.StudentID = ST.StudentID AND TT.TeacherID = ST.TeacherID AND TT.SubjectID = ST.SubjectID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentID, TeacherID, SubjectID, DateID, TimeID, Grade)
    VALUES (ST.StudentID, ST.TeacherID, ST.SubjectID, ST.DateID, ST.TimeID, ST.Grade);
GO

DROP VIEW vETLClasses;
DROP TABLE GradeMapping;
GO