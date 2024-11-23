use hurtownie
-- Insert into Time_
INSERT INTO Time_ (Hour_, Time_of_day)
VALUES 
    (0, 'między 0 a 8'),
    (2, 'między 0 a 8'),
    (6, 'między 0 a 8'),
    (9, 'między 9 a 12'),
    (11, 'między 9 a 12'),
    (14, 'między 13 a 15'),
    (16, 'między 16 a 20'),
    (19, 'między 16 a 20'),
    (21, 'między 21 a 23'),
    (23, 'między 21 a 23');

-- Insert into Date_
INSERT INTO Date_ (Day_, Year_, Month_, MonthNo)
VALUES 
    (1, 2024, 'Styczeń', 1),
    (15, 2024, 'Luty', 2),
    (28, 2024, 'Marzec', 3),
    (30, 2024, 'Kwiecień', 4),
    (10, 2024, 'Maj', 5),
    (25, 2024, 'Czerwiec', 6),
    (12, 2023, 'Lipiec', 7),
    (22, 2023, 'Sierpień', 8),
    (5, 2023, 'Wrzesień', 9),
    (18, 2023, 'Październik', 10);

-- Insert into Student
INSERT INTO Student (StudentNo, First_name, Family_name, Parent_number, Email, ClassID, Year_of_graduation, isCurrent)
VALUES
    (1001, 'Adam', 'Kowalski', '123-456-789', 'adam.kowalski@gmail.com', '1-A', 2025, 1),
    (1002, 'Ewa', 'Nowak', '234-567-890', 'ewa.nowak@gmail.com', '1-B', 2025, 1),
    (1003, 'Marek', 'Wiśniewski', '345-678-901', 'marek.w@gmail.com', '2-A', 2024, 0),
    (1004, 'Anna', 'Zielińska', '456-789-012', 'anna.zielinska@gmail.com', '2-B', 2023, 0),
    (1005, 'Piotr', 'Krawczyk', '567-890-123', 'piotr.k@gmail.com', '1-C', 2025, 1),
    (1006, 'Joanna', 'Dąbrowska', '678-901-234', 'joanna.d@gmail.com', '2-C', 2024, 0),
    (1007, 'Krzysztof', 'Lewandowski', '789-012-345', 'krzysztof.l@gmail.com', '3-A', 2023, 0),
    (1008, 'Maria', 'Kamińska', '890-123-456', 'maria.k@gmail.com', '3-B', 2023, 0),
    (1009, 'Tomasz', 'Piotrowski', '901-234-567', 'tomasz.p@gmail.com', '4-A', 2025, 1),
    (1010, 'Zofia', 'Wojciechowska', '012-345-678', 'zofia.w@gmail.com', '4-B', 2025, 1);

-- Insert into Teacher
INSERT INTO Teacher (TeacherID, TeacherNo, First_name, Family_name, Phone_number)
VALUES
    ('t000001', 1, 'Jan', 'Kowalski', '123-456-789'),
    ('t000002', 2, 'Karolina', 'Nowak', '234-567-890'),
    ('t000003', 3, 'Michał', 'Lewandowski', '345-678-901'),
    ('t000004', 4, 'Agnieszka', 'Wiśniewska', '456-789-012'),
    ('t000005', 5, 'Kamil', 'Zieliński', '567-890-123'),
    ('t000006', 6, 'Beata', 'Kamińska', '678-901-234'),
    ('t000007', 7, 'Szymon', 'Krawczyk', '789-012-345'),
    ('t000008', 8, 'Ewelina', 'Piotrowska', '890-123-456'),
    ('t000009', 9, 'Paweł', 'Wojciechowski', '901-234-567'),
    ('t000010', 10, 'Sylwia', 'Zawadzka', '012-345-678');

-- Insert into Subjects
INSERT INTO Subjects (SubjectID, SubjectNo, Subject_name, Main_teacher, Year_of_actualization, Types_of_lessons, hourRange, Year_, isCurrent)
VALUES
    ('001', 1, 'Matematyka', 't000001', 2020, 'Teoria, Praktyka', '10-12', 2023, 1),
    ('002', 2, 'Fizyka', 't000002', 2019, 'Teoria', '9-11', 2023, 1),
    ('003', 3, 'Chemia', 't000003', 2018, 'Praktyka', '12-14', 2023, 1),
    ('004', 4, 'Biologia', 't000004', 2021, 'Teoria', '10-12', 2023, 1),
    ('005', 5, 'Historia', 't000005', 2022, 'Teoria', '9-11', 2023, 1),
    ('006', 6, 'Geografia', 't000006', 2017, 'Praktyka', '11-13', 2023, 1),
    ('007', 7, 'Informatyka', 't000007', 2021, 'Teoria, Praktyka', '13-15', 2023, 1),
    ('008', 8, 'Język Polski', 't000008', 2023, 'Teoria', '10-12', 2023, 1),
    ('009', 9, 'W-F', 't000009', 2020, 'Praktyka', '8-10', 2023, 1),
    ('010', 10, 'Język Angielski', 't000010', 2019, 'Teoria, Praktyka', '12-14', 2023, 1);
-- Insert into Classes
INSERT INTO Classes (StudentID, TeacherID, SubjectID, DateID, TimeID, Grade)
VALUES
    (1, 't000001', '001', 1, 1, 5.0),
    (2, 't000002', '002', 2, 2, 4.5),
    (3, 't000003', '003', 3, 3, 3.0),
    (4, 't000004', '004', 4, 4, 4.0),
    (5, 't000005', '005', 5, 5, 5.5),
    (6, 't000006', '006', 6, 6, 3.5),
    (7, 't000007', '007', 7, 7, 4.0),
    (8, 't000008', '008', 8, 8, 5.0),
    (9, 't000009', '009', 9, 9, 2.5),
    (10, 't000010', '010', 10, 10, 3.0);

-- Insert into Funding
INSERT INTO Funding (SubjectID, DateID, TransactionID, PartnerID, Grant_amount)
VALUES
    ('001', 1, 1001, 2001, 15000.00),
    ('002', 2, 1002, 2002, 12000.00),
    ('003', 3, 1003, 2003, 18000.00),
    ('004', 4, 1004, 2004, 25000.00),
    ('005', 5, 1005, 2005, 17000.00),
    ('006', 6, 1006, 2006, 11000.00),
    ('007', 7, 1007, 2007, 13000.00),
    ('008', 8, 1008, 2008, 22000.00),
    ('009', 9, 1009, 2009, 19000.00),
    ('010', 10, 1010, 2010, 20000.00);

-- Insert into Exam
INSERT INTO Exam (StudentID, SubjectID, DateID, ExaminatorID, Grade)
VALUES
    (1, '001', 1, 5001, 85.0),
    (2, '002', 2, 5002, 90.0),
    (3, '003', 3, 5003, 75.0),
    (4, '004', 4, 5004, 80.0),
    (5, '005', 5, 5005, 95.0),
    (6, '006', 6, 5006, 88.0),
    (7, '007', 7, 5007, 70.0),
    (8, '008', 8, 5008, 85.0),
    (9, '009', 9, 5009, 60.0),
    (10, '010', 10, 5010, 78.0);