USE hurtownie;
GO

IF OBJECT_ID('vETLTeacher','V') IS NOT NULL DROP VIEW vETLTeacher;
GO

CREATE VIEW vETLTeacher AS
SELECT 
    TeacherNo = CAST(SUBSTRING(TeacherID, 2, LEN(TeacherID)) AS INT),
    First_name,
    Family_name,
    Phone_number
FROM LiderDB.dbo.Teacher;
GO

MERGE INTO Teacher AS TT
USING vETLTeacher AS ST
ON TT.TeacherNo = ST.TeacherNo
WHEN NOT MATCHED BY TARGET THEN
    INSERT (TeacherNo, First_name, Family_name, Phone_number)
    VALUES (ST.TeacherNo, ST.First_name, ST.Family_name, ST.Phone_number);
GO

DROP VIEW vETLTeacher;
