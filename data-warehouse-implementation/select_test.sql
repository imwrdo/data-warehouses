use hurtownie
-- find the grades of all students
SELECT s.First_name, s.Family_name, c.Grade 
FROM Student s
JOIN Classes c ON s.StudentID = c.StudentID;

-- Retrieve the funding details for each subject
SELECT s.Subject_name, f.Grant_amount 
FROM Funding f
JOIN Subjects s ON f.SubjectID = s.SubjectID;

-- Find all students graduating in a specific year (e.g., 2025)
SELECT First_name, Family_name, Year_of_graduation 
FROM Student 
WHERE Year_of_graduation = 2025;

-- Count the number of students currently enrolled
SELECT COUNT(*) AS Current_Students 
FROM Student 
WHERE isCurrent = 1;

-- Find the top-performing student in each subject based on exam grades
SELECT e.SubjectID, s.First_name, s.Family_name, MAX(e.Grade) AS Max_Grade
FROM Exam e
JOIN Student s ON e.StudentID = s.StudentID
GROUP BY e.SubjectID, s.First_name, s.Family_name;

-- List all subjects with no funding records
SELECT s.Subject_name 
FROM Subjects s
LEFT JOIN Funding f ON s.SubjectID = f.SubjectID
WHERE f.SubjectID IS NULL;

-- Find the total funding received for each year
SELECT d.Year_, SUM(f.Grant_amount) AS Total_Funding
FROM Funding f
JOIN Date_ d ON f.DateID = d.DateID
GROUP BY d.Year_;

-- Identify students who scored below 60 in any exam:
SELECT s.First_name, s.Family_name, e.SubjectID, e.Grade 
FROM Exam e
JOIN Student s ON e.StudentID = s.StudentID
WHERE e.Grade < 60;

-- Find the student with the highest average grade across all subjects
SELECT TOP 1 s.StudentID, s.First_name, s.Family_name, AVG(e.Grade) AS Avg_Grade
FROM Exam e
JOIN Student s ON e.StudentID = s.StudentID
GROUP BY s.StudentID, s.First_name, s.Family_name
ORDER BY Avg_Grade DESC;

-- Find the cumulative funding amount per year and subject
SELECT d.Year_, s.Subject_name, SUM(f.Grant_amount) AS Cumulative_Funding
FROM Funding f
JOIN Date_ d ON f.DateID = d.DateID
JOIN Subjects s ON f.SubjectID = s.SubjectID
GROUP BY d.Year_, s.Subject_name
ORDER BY d.Year_, s.Subject_name;

-- Rank students based on their total exam grades across all subjects
SELECT s.StudentID, s.First_name, s.Family_name, SUM(e.Grade) AS Total_Grade,
       RANK() OVER (ORDER BY SUM(e.Grade) DESC) AS Rank
FROM Exam e
JOIN Student s ON e.StudentID = s.StudentID
GROUP BY s.StudentID, s.First_name, s.Family_name;

