import csv
import random

input_filename_1 = "class_data.txt"


def prepare_data(file,output_file):
    try:
        with open(file, 'r', encoding='utf-8') as infile, \
             open(output_file, 'w', encoding='utf-8', newline='') as outfile:

            writer = csv.writer(outfile)
            
            for line in infile:
                parts = line.strip().split(",")
                if len(parts) > 1:  # Ensure line has the required parts
                    numeric_value_student_id = int(parts[1][1:])
                    numeric_value_teacher_id = int(parts[2][1:])
                    numeric_value_subject_id = int(parts[3])
                    date_id = random.randint(1, 81100)
                    time_id = random.randint(7, 17)
                    grade = round(random.uniform(0, 6 - 0.01), 1)
                    add = (numeric_value_student_id,numeric_value_teacher_id,numeric_value_subject_id,date_id,time_id,grade)
                    
                    writer.writerow(add)
            
        print(f"Files combined successfully into {output_file}.")
    except FileNotFoundError as e:
        print(f"Error: {e.filename} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")


prepare_data(input_filename_1,'grades.csv')