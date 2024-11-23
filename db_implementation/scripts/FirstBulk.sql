BULK INSERT Student
FROM 'C:\Users\User\Desktop\save\save2\Students_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Teacher
FROM 'C:\Users\User\Desktop\save\save2\Teachers_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Subjects
FROM 'C:\Users\User\Desktop\save\save2\Subjects_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Classes
FROM 'C:\Users\User\Desktop\save\save2\Classes_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Reviews
FROM 'C:\Users\User\Desktop\save\save2\Reviews_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Funding
FROM 'C:\Users\User\Desktop\save\save2\Fundings_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Olympiads
FROM 'C:\Users\User\Desktop\save\save2\Olympiads_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Exam_grades
FROM 'C:\Users\User\Desktop\save\save2\Exam_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)