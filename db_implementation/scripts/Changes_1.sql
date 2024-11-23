
Select Student.StudentID, Student.First_name, Student.Family_name, Classes.Type_of_class, Classes.TeacherID, Teacher.First_name, Teacher.Family_name, Teacher.TeacherID from Student
INNER JOIN Classes on Student.StudentID = Classes.StudentID INNER JOIN Teacher on Teacher.TeacherID=Classes.TeacherID
where Student.StudentID = 's000498' and Teacher.TeacherID='t000020'

Update Student
Set First_name = 'Nie Robert'
where StudentID='s000498'

Select Student.StudentID, First_name, Family_name, Classes.Type_of_class, Classes.TeacherID from Student
INNER JOIN Classes on Student.StudentID = Classes.StudentID
where Student.StudentID='s000498'



Select * from Subjects
INNER JOIN Teacher on Teacher.TeacherID=Subjects.Main_teacher
where Main_teacher='t000020'

Update Teacher
Set Family_name = 'Nie Matuszewski'
where TeacherID='t000020'

Select * from Subjects
INNER JOIN Teacher on Teacher.TeacherID=Subjects.Main_teacher
where Main_teacher='t000020'





Select Student.StudentID, Student.First_name, Student.Family_name, Classes.Type_of_class, Classes.TeacherID, Teacher.First_name, Teacher.Family_name, Teacher.TeacherID from Student
INNER JOIN Classes on Student.StudentID = Classes.StudentID INNER JOIN Teacher on Teacher.TeacherID=Classes.TeacherID
where Student.StudentID = 's000498' and Teacher.TeacherID='t000020'