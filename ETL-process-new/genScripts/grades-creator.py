import csv
import random

input_filename_1 = "Classes_1_data.txt"
input_filename_2 = "Classes_2_data.txt"

def combine_file(file1, file2, output_file):
    try:
        with open(file1, 'r', encoding='utf-8') as infile1, \
             open(file2, 'r', encoding='utf-8') as infile2, \
             open(output_file, 'w', encoding='utf-8', newline='') as outfile:

            unique_names = set()
            writer = csv.writer(outfile)
            
            # Read and write the contents of the first file
            for row in infile1:
                parts = row.strip().split(",")
                writer.writerow(parts)
            # Read and write the contents of the second file
            for row in infile2:
                parts = row.strip().split(",")
                writer.writerow(parts)

        print(f"Files combined successfully into {output_file}.")
    except FileNotFoundError as e:
        print(f"Error: {e.filename} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

unique_combinations = set()

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
                    date_id = random.randint(1, 14012)
                    time_id = random.randint(7, 17)
                    grade = round(random.uniform(0, 6 - 0.01), 1)
                    add = (numeric_value_student_id,numeric_value_teacher_id,numeric_value_subject_id,date_id,time_id,grade)
                    
                    writer.writerow(add)
            
        print(f"Files combined successfully into {output_file}.")
    except FileNotFoundError as e:
        print(f"Error: {e.filename} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

combine_file(input_filename_1,input_filename_2,'grades.txt')
prepare_data('grades.txt','grades.csv')