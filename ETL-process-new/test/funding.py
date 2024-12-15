import csv
import random

input_filename_1 = "Exam_1_data.txt"
input_filename_2 = "Exam_2_data.txt"

def combine_file(file1, output_file):
    try:
        with open(file1, 'r', encoding='utf-8') as infile1, \
             open(output_file, 'w', encoding='utf-8', newline='') as outfile:
                 
            writer = csv.writer(outfile)
            
            # Read and write the contents of the first file
            for row in infile1:
                parts = row.strip().split(",")
                parts[4] = random.randint(1, 100)
                writer.writerow(parts)
            # Read and write the contents of the second file

        print(f"Files combined successfully into {output_file}.")
    except FileNotFoundError as e:
        print(f"Error: {e.filename} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")
        
combine_file(input_filename_1,"Exam_1_data_fixed.txt")
combine_file(input_filename_2,"Exam_2_data_fixed.txt")