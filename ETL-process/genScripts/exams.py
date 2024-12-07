import random

# Define the range of IDs and other constraints
num_students = 9999  # Replace with the actual number of students
num_teachers = 999   # Replace with the actual number of teachers
num_subjects = 699    # Replace with the actual number of subjects
num_dates = 14012     # Replace with the actual number of dates
exam_grade_min = 1.0
exam_grade_max = 100

unique_combinations = set()
counter = 2000
# Open the file for writing

with open("Exam_1_data.txt", "w") as file:
    for _ in range(counter-1000):
        while True:
            # Randomly select IDs
            student_id = random.randint(1, num_students)
            examinator_id = random.randint(1, num_teachers)
            subject_id = random.randint(1, num_subjects)
            date_id = random.randint(1, num_dates)

            # Ensure the combination is unique
            combination = (student_id, subject_id, date_id, examinator_id)
            if combination not in unique_combinations:
                unique_combinations.add(combination)
                break

        # Generate a random grade
        exam_grade = round(random.uniform(exam_grade_min, exam_grade_max - 0.01), 1)

        # Write the row to the file
        file.write(f"{student_id},{subject_id},{date_id},{examinator_id},{exam_grade}\n")

num_students = 13899  # Replace with the actual number of students
num_teachers = 1100   # Replace with the actual number of teachers
num_subjects = 749    # Replace with the actual number of subjects
num_dates = 14012     # Replace with the actual number of dates
exam_grade_min = 1.0
exam_grade_max = 100

with open("Exam_2_data.txt", "w") as file:
    for _ in range(counter-1000):
        while True:
            # Randomly select IDs
            student_id = random.randint(1, num_students)
            examinator_id = random.randint(1, num_teachers)
            subject_id = random.randint(1, num_subjects)
            date_id = random.randint(1, num_dates)

            # Ensure the combination is unique
            combination = (student_id, subject_id, date_id, examinator_id)
            if combination not in unique_combinations:
                unique_combinations.add(combination)
                break

        # Generate a random grade
        exam_grade = round(random.uniform(exam_grade_min, exam_grade_max - 0.01), 1)

        # Write the row to the file
        file.write(f"{student_id},{subject_id},{date_id},{examinator_id},{exam_grade}\n")