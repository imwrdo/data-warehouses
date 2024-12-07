BULK INSERT Student
FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\db-implementation\data_bulk\Students_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Teacher
FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\db-implementation\data_bulk\Teachers_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Subjects
FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\db-implementation\data_bulk\Subjects_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Classes
FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\db-implementation\data_bulk\Classes_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Reviews
FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\db-implementation\data_bulk\Reviews_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Funding
FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\db-implementation\data_bulk\Fundings_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Olympiads
FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\db-implementation\data_bulk\Olympiads_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Exam_grades
FROM 'C:\Users\MIdax\Desktop\Projects\CurlyGayHD\data-warehouses\db-implementation\data_bulk\Exam_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)