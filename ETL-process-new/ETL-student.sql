USE hurtownie;
GO

IF OBJECT_ID('vETLStudent') IS NOT NULL DROP VIEW vETLStudent;
GO

CREATE VIEW vETLStudent AS
SELECT 
    StudentNo = CAST(SUBSTRING(StudentID, 2, LEN(StudentID)) AS INT),
    First_name,
    Family_name,
    Parent_number,
    Email,
    ClassID = LEFT(ClassID, 1) + '-' + RIGHT(ClassID, 1),
    Year_of_graduation = YEAR(Year_of_graduation),
    isCurrent = CASE WHEN Year_of_graduation >= YEAR(GETDATE()) THEN 1 ELSE 0 END
FROM dbo.Student;
GO

MERGE INTO Student AS TT
USING vETLStudent AS ST
ON TT.StudentNo = ST.StudentNo
WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentNo, First_name, Family_name, Parent_number, Email, ClassID, Year_of_graduation, isCurrent)
    VALUES (ST.StudentNo, ST.First_name, ST.Family_name, ST.Parent_number, ST.Email, ST.ClassID, ST.Year_of_graduation, ST.isCurrent);
GO

DROP VIEW vETLStudent;
