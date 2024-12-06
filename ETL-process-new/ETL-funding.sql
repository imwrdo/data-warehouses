USE hurtownie;
GO
 
-- Drop the view if it already exists
IF OBJECT_ID('vETLFunding', 'V') IS NOT NULL DROP VIEW vETLFunding;
GO
 
-- Create a temporary table to load the CSV data into
IF OBJECT_ID('PartnerMapping') IS NOT NULL DROP TABLE PartnerMapping;
 
CREATE TABLE PartnerMapping (
    Partner_name NVARCHAR(255),
    PartnerID INT
);
 
-- Load CSV data into the temporary table using OPENROWSET
BULK insert PartnerMapping
	FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\ETL-process-new\partners.csv' with
	(
    FIELDTERMINATOR = ',',             -- Comma delimiter
    ROWTERMINATOR = '\n',              -- New line for rows
    FIRSTROW = 1                      -- Skipping the header row
)
 go 

CREATE VIEW vETLFunding AS
SELECT 
    SubjectID = (SELECT SubjectID FROM Subjects WHERE SubjectNo = CAST(Purpose AS INT)),
    DateID = (SELECT DateID FROM Date_ WHERE Day_ = DAY(Date_) AND MonthNo = MONTH(Date_) AND Year_ = YEAR(Date_)),
    TransactionID = CAST(TransactionID AS INT),
    PartnerID = (SELECT PartnerID FROM PartnerMapping WHERE PartnerMapping.Partner_name = Funding.Partner_name),
    Grant_amount
FROM LiderDB.dbo.Funding;
GO
select * from PartnerMapping
-- Perform the MERGE operation
MERGE INTO Funding AS TT
USING vETLFunding AS ST
ON TT.SubjectID = ST.SubjectID AND TT.DateID = ST.DateID AND TT.TransactionID = ST.TransactionID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (SubjectID, DateID, TransactionID, PartnerID, Grant_amount)
    VALUES (ST.SubjectID, ST.DateID, ST.TransactionID, ST.PartnerID, ST.Grant_amount);
GO
 
-- Clean up: Drop the view and the temporary table after the operation
DROP VIEW vETLFunding;
DROP TABLE PartnerMapping;
GO