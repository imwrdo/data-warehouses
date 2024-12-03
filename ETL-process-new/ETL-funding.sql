USE hurtownie;
GO

IF OBJECT_ID('vETLFunding') IS NOT NULL DROP VIEW vETLFunding;
GO

CREATE VIEW vETLFunding AS
SELECT 
    SubjectID = (SELECT SubjectID FROM Subjects WHERE SubjectNo = CAST(Purpose AS INT)),
    DateID = (SELECT DateID FROM Date_ WHERE Day_ = DAY(Date_) AND MonthNo = MONTH(Date_) AND Year_ = YEAR(Date_)),
    TransactionID = CAST(TransactionID AS INT),
    PartnerID = ROW_NUMBER() OVER (ORDER BY Partner_name),
    Grant_amount
FROM dbo.Funding;
GO

MERGE INTO Funding AS TT
USING vETLFunding AS ST
ON TT.SubjectID = ST.SubjectID AND TT.DateID = ST.DateID AND TT.TransactionID = ST.TransactionID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (SubjectID, DateID, TransactionID, PartnerID, Grant_amount)
    VALUES (ST.SubjectID, ST.DateID, ST.TransactionID, ST.PartnerID, ST.Grant_amount);
GO

DROP VIEW vETLFunding;
