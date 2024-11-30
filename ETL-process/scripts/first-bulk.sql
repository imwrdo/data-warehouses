use hurtownie

BULK INSERT Student
FROM '~/PG/data-warehouses/ETL-process/data/Students_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Teacher
FROM '~/PG/data-warehouses/ETL-process/data/Teachers_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Subjects
FROM '~/PG/data-warehouses/ETL-process/data/Subjects_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Classes
FROM '~/PG/data-warehouses/ETL-process/data/Classes_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Funding
FROM '~/PG/data-warehouses/ETL-process/data/Fundings_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)


BULK INSERT Exam
FROM '~/PG/data-warehouses/ETL-process/data/Exam_1_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)