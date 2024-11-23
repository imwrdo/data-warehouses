/*Select Reviews.StudentID, Student.First_name, Student.Family_name, Student.Parent_number from Student
INNER JOIN Reviews on Student.StudentID=Reviews.StudentID
where Student.StudentID='s013845'

Update Student
Set Parent_number='111-111-111'
where Parent_number='325-127-755'

Select Reviews.StudentID, Student.First_name, Student.Family_name, Student.Parent_number from Student
INNER JOIN Reviews on Student.StudentID=Reviews.StudentID
where Student.StudentID='s013845'*/

/*Select Partner_name, Date_, Purpose, Subjects.Subject_name from Funding
INNER JOIN Subjects on Subjects.SubjectID=Purpose
where TransactionID='020629'

Update Subjects
Set Subject_name='Some changed name'
where SubjectID='722'

Select Partner_name, Date_, Purpose, Subjects.Subject_name from Funding
INNER JOIN Subjects on Subjects.SubjectID=Purpose
where TransactionID='020629'*/

Select Olympiads.OlympiadID, Olympiads.StudentID, Student.First_name, Student.Family_name, Student.StudentID, Student.Email from Olympiads
INNER JOIN Student on Student.StudentID=Olympiads.StudentID
where Student.StudentID='s000770' or Student.StudentID='s999999'

Update Student
Set Email='SomeNewEmail@cos.cos2'
where First_name = 'MIRON' and Family_name = 'CZAJKOWSKI'

Select Olympiads.OlympiadID, Olympiads.StudentID, Student.First_name, Student.Family_name, Student.StudentID, Student.Email from Olympiads
INNER JOIN Student on Student.StudentID=Olympiads.StudentID
where Student.StudentID='s000770' or Student.StudentID='s999999'