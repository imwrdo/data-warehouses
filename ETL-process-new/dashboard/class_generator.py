import random

def generate_id(prefix, min_val, max_val, digits=6):
    """Generate an ID with a specific prefix and within a given range."""
    number = random.randint(min_val, max_val)
    return f"{prefix}{number:0{digits}d}"

def generate_day():
    """Randomly select a day of the week."""
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    return random.choice(days)

def generate_class_type():
    """Randomly select a class type."""
    class_types = ["Wyklad", "Laboratorium", "Cwiczenia", "Projekt"]
    return random.choice(class_types)

def generate_class_data(num_records=10):
    """Generate class data records."""
    data = set()
    combinations = set()  # Track unique combinations
    attempts = 0
    max_attempts = num_records * 10  # Prevent infinite loops

    while len(data) < num_records and attempts < max_attempts:
        class_id = generate_id("c", 0, 999999)
        student_id = generate_id("s", 0, 13899)
        teacher_id = generate_id("t", 0, 1099)
        subject_id = generate_id("", 0, 749, 3)
        
        # Check if combination is unique
        combination = (student_id, teacher_id, subject_id)
        if combination not in combinations:
            day = generate_day()
            class_type = generate_class_type()
            record = f"{class_id},{student_id},{teacher_id},{subject_id},{day},{class_type}"
            data.add(record)
            combinations.add(combination)
        
        attempts += 1

    if attempts >= max_attempts:
        print(f"Warning: Could only generate {len(data)} unique records")
        
    return list(data)

def main():
    num_records = 400000  # Adjust the number of records as needed
    data = generate_class_data(num_records)
    output_file = "class_data.txt"
    with open(output_file, "w") as file:
        for record in data:
            file.write(record + "\n")
    print(f"Data written to {output_file}")

if __name__ == "__main__":
    main()
