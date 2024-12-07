import random

# Define the range of IDs and other constraints
num_students = 9999  # Replace with the actual number of students
num_teachers = 999   # Replace with the actual number of teachers
num_subjects = 699    # Replace with the actual number of subjects
num_dates = 14012     # Replace with the actual number of dates
num_times = 17      # Replace with the actual number of time entries
grade_min = 1.0
grade_max = 6.0

unique_combinations = set()
counter = 100000
# Open the file for writing

with open("Classes_1_data.txt", "w") as file:
    for _ in range(counter-20000):
        while True:
            # Randomly select IDs
            student_id = random.randint(1, num_students)
            teacher_id = random.randint(1, num_teachers)
            subject_id = random.randint(1, num_subjects)
            date_id = random.randint(1, num_dates)
            time_id = random.randint(7, num_times)

            # Ensure the combination is unique
            combination = (student_id, teacher_id, subject_id, date_id, time_id)
            if combination not in unique_combinations:
                unique_combinations.add(combination)
                break

        # Generate a random grade
        grade = round(random.uniform(grade_min, grade_max - 0.01), 1)

        # Write the row to the file
        file.write(f"{student_id},{teacher_id},{subject_id},{date_id},{time_id},{grade}\n")

num_students = 13899  # Replace with the actual number of students
num_teachers = 1100   # Replace with the actual number of teachers
num_subjects = 749    # Replace with the actual number of subjects
num_dates = 14012     # Replace with the actual number of dates
num_times = 17      # Replace with the actual number of time entries
grade_min = 1.0
grade_max = 6.0


with open("Classes_2_data.txt", "w") as file:
    for _ in range(20000):
        while True:
            # Randomly select IDs
            student_id = random.randint(1, num_students)
            teacher_id = random.randint(1, num_teachers)
            subject_id = random.randint(1, num_subjects)
            date_id = random.randint(1, num_dates)
            time_id = random.randint(7, num_times)

            # Ensure the combination is unique
            combination = (student_id, teacher_id, subject_id, date_id, time_id)
            if combination not in unique_combinations:
                unique_combinations.add(combination)
                break

        # Generate a random grade
        grade = round(random.uniform(grade_min, grade_max - 0.01), 1)

        # Write the row to the file
        file.write(f"{student_id},{teacher_id},{subject_id},{date_id},{time_id},{grade}\n")


        