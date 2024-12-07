


input_file = "Teachers_2_data.txt"
output_file = "Teachers_2_correct_data.txt"

# Add row number column using a counter
def add_row_number(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as infile, \
         open(output_path, 'w', encoding='utf-8') as outfile:
        
        counter = 1001
        for line in infile:
            outfile.write(f"{counter},{line}")
            counter += 1

# Run the function
add_row_number(input_file, output_file)

print(f"Row numbers added and saved to {output_file}.")
