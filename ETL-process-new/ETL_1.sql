SELECT 
    StudentID = (SELECT StudentID FROM Student WHERE StudentNo = CAST(SUBSTRING(ST.StudentID, 2, LEN(ST.StudentID)-1) AS INT))
FROM LiderDB.dbo.Classes AS ST;