USE hurtownie;
GO

IF OBJECT_ID('vETLSubjects','V') IS NOT NULL DROP VIEW vETLSubjects;
GO

CREATE VIEW vETLSubjects AS
SELECT 
    SubjectNo = CAST(SubjectID AS INT),
    Subject_name,
    Main_teacher = CAST(SUBSTRING(Main_teacher, 2, LEN(Main_teacher)) AS INT),
    Year_of_actualization,
    Types_of_lessons,
    hourRange = CASE 
        WHEN Hours_ < 50 THEN 'Low'
        WHEN Hours_ BETWEEN 51 AND 200 THEN 'Medium'
        ELSE 'High'
    END,
    Year_,
    isCurrent = CASE WHEN Year_of_actualization >= YEAR(GETDATE()) THEN 1 ELSE 0 END
FROM LiderDB.dbo.Subjects;
GO

MERGE INTO Subjects AS TT
USING vETLSubjects AS ST
ON TT.SubjectNo = ST.SubjectNo
WHEN NOT MATCHED BY TARGET THEN
    INSERT (SubjectNo, Subject_name, Main_teacher, Year_of_actualization, Types_of_lessons, hourRange, Year_, isCurrent)
    VALUES (ST.SubjectNo, ST.Subject_name, ST.Main_teacher, ST.Year_of_actualization, ST.Types_of_lessons, ST.hourRange, ST.Year_, ST.isCurrent);
GO

DROP VIEW vETLSubjects;
