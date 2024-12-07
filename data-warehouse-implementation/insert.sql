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
INSERT INTO Teacher (TeacherNo, First_name, Family_name, Phone_number)
VALUES
    (1, 'Jan', 'Kowalski', '123-456-789'),
    (2, 'Karolina', 'Nowak', '234-567-890'),
    (3, 'Michał', 'Lewandowski', '345-678-901'),
    (4, 'Agnieszka', 'Wiśniewska', '456-789-012'),
    (5, 'Kamil', 'Zieliński', '567-890-123'),
    (6, 'Beata', 'Kamińska', '678-901-234'),
    (7, 'Szymon', 'Krawczyk', '789-012-345'),
    (8, 'Ewelina', 'Piotrowska', '890-123-456'),
    (9, 'Paweł', 'Wojciechowski', '901-234-567'),
    (10, 'Sylwia', 'Zawadzka', '012-345-678');


-- Insert into Subjects
INSERT INTO Subjects (SubjectNo, Subject_name, Main_teacher, Year_of_actualization, Types_of_lessons, hourRange, Year_, isCurrent)
VALUES
    (1, 'Matematyka', 1, 2020, 'Teoria, Praktyka', '10-12', 2023, 1),
    (2, 'Fizyka', 2, 2019, 'Teoria', '9-11', 2023, 1),
    (3, 'Chemia', 3, 2018, 'Praktyka', '12-14', 2023, 1),
    (4, 'Biologia', 4, 2021, 'Teoria', '10-12', 2023, 1),
    (5, 'Historia', 5, 2022, 'Teoria', '9-11', 2023, 1),
    (6, 'Geografia', 6, 2017, 'Praktyka', '11-13', 2023, 1),
    (7, 'Informatyka', 7, 2021, 'Teoria, Praktyka', '13-15', 2023, 1),
    (8, 'Język Polski', 8, 2023, 'Teoria', '10-12', 2023, 1),
    (9, 'W-F', 9, 2020, 'Praktyka', '8-10', 2023, 1),
    (10, 'Język Angielski', 10, 2019, 'Teoria, Praktyka', '12-14', 2023, 1);




-- Insert into Classes
INSERT INTO Classes (StudentID, TeacherID, SubjectID, DateID, TimeID, Grade)
VALUES
    (1, 1, 1, 1, 1, 5.0),
    (2, 2, 2, 2, 2, 4.5),
    (3, 3, 3, 3, 3, 3.0),
    (4, 4, 4, 4, 4, 4.0),
    (5, 5, 5, 5, 5, 5.5),
    (6, 6, 6, 6, 6, 3.5),
    (7, 7, 7, 7, 7, 4.0),
    (8, 8, 8, 8, 8, 5.0),
    (9, 9, 9, 9, 9, 2.5),
    (10, 10, 10, 10, 10, 3.0);

-- Insert into Funding
INSERT INTO Funding (SubjectID, DateID, TransactionID, PartnerID, Grant_amount)
VALUES
    (1, 1, 1, 1, 15000.00),
    (2, 2, 2, 2, 12000.00),
    (3, 3, 3, 3, 18000.00),
    (4, 4, 4, 4, 25000.00),
    (5, 5, 5, 5, 17000.00),
    (6, 6, 6, 6, 11000.00),
    (7, 7, 7, 7, 13000.00),
    (8, 8, 8, 8, 22000.00),
    (9, 9, 9, 9, 19000.00),
    (10, 10, 10, 10, 20000.00);

-- Insert into Exam
INSERT INTO Exam (StudentID, SubjectID, DateID, ExaminatorID, Grade)
VALUES
    (1, 1, 1, 1, 85.0),
    (2, 2, 2, 2, 90.0),
    (3, 3, 3, 3, 75.0),
    (4, 4, 4, 4, 80.0),
    (5, 5, 5, 5, 95.0),
    (6, 6, 6, 6, 88.0),
    (7, 7, 7, 7, 70.0),
    (8, 8, 8, 8, 85.0),
    (9, 9, 9, 9, 60.0),
    (10, 10, 10, 10, 78.0);