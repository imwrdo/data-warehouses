use hurtownie

use hurtownie

BULK INSERT Student
FROM '~/PG/data-warehouses/ETL-process/data/Students_2_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Teacher
FROM '~/PG/data-warehouses/ETL-process/data/Teachers_2_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Subjects
FROM '~/PG/data-warehouses/ETL-process/data/Subjects_2_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Classes
FROM '~/PG/data-warehouses/ETL-process/data/Classes_2_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)

BULK INSERT Funding
FROM '~/PG/data-warehouses/ETL-process/data/Fundings_2_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)


BULK INSERT Exam
FROM '~/PG/data-warehouses/ETL-process/data/Exam_2_data.txt'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CHECK_CONSTRAINTS
)