import csv

input_filename_1 = "Fundings_1_data.txt"
output_filename_1 = "Fundings_1_data.csv"
input_filename_2 = "Fundings_2_data.txt"
output_filename_2 = "Fundings_2_data.csv"

def combine_csv(file1, file2, output_file):
    try:
        with open(file1, 'r', encoding='utf-8') as infile1, \
             open(file2, 'r', encoding='utf-8') as infile2, \
             open(output_file, 'w', encoding='utf-8', newline='') as outfile:

            unique_names = set()
            writer = csv.writer(outfile)
            
            # Read and write the contents of the first file
            for row in infile1:
                parts = row.strip().split(",")
                if len(parts) > 1 and parts[1] not in unique_names:
                    unique_names.add(parts[1])
                    writer.writerow(parts)
            
            # Read and write the contents of the second file
            for row in infile2:
                parts = row.strip().split(",")
                if len(parts) > 1 and parts[1] not in unique_names:
                    unique_names.add(parts[1])
                    writer.writerow(parts)

        print(f"Files combined successfully into {output_file}.")
    except FileNotFoundError as e:
        print(f"Error: {e.filename} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")


def process_file(input_filename, output_filename):
    unique_names = {}
    current_index = 0

    try:
        with open(input_filename, 'r', encoding='utf-8') as infile, \
             open(output_filename, 'w', encoding='utf-8', newline='') as outfile:

            writer = csv.writer(outfile)
            
            for line in infile:
                parts = line.strip().split(",")
                if len(parts) > 1:  # Ensure line has the required parts
                    name = parts[1]
                    if name not in unique_names:
                        unique_names[name] = current_index
                        current_index += 1
                        # Write the unique name and its index to the output file
                        writer.writerow([name, unique_names[name]])

        print(f"Processing complete. Output saved to {output_filename}.")
    except FileNotFoundError:
        print(f"File {input_filename} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")


# Example usage

combine_csv(input_filename_1, input_filename_2, 'partners.txt')

process_file('partners.txt', 'partners.csv')
