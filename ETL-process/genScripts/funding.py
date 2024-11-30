import random

num_subjects = 749    # Replace with the actual number of subjects
num_dates = 14012     # Replace with the actual number of dates
funding_max = 2000000.0

unique_combinations = set()
counter = 100000
# Open the file for writing

with open("Fundings_1_data.txt", "w") as file:
    for _ in range(counter-20000):
        while True:
            # Randomly select IDs
            subject_id = random.randint(1, num_subjects)
            date_id = random.randint(1, num_dates)
            transaction_id = random.randint(1,10000)
            partner_id = random.randint(1,3000)

            # Ensure the combination is unique
            combination = (subject_id, date_id,transaction_id,partner_id)
            if combination not in unique_combinations:
                unique_combinations.add(combination)
                break

        # Generate a random grade
        grant_amount = round(random.uniform(1, funding_max - 0.01), 1)

        # Write the row to the file
        file.write(f"{subject_id},{date_id},{transaction_id},{partner_id},{grant_amount}\n")

with open("Fundings_2_data.txt", "w") as file:
    for _ in range(20000):
        while True:
            # Randomly select IDs
            subject_id = random.randint(1, num_subjects)
            date_id = random.randint(1, num_dates)
            transaction_id = random.randint(1,10000)
            partner_id = random.randint(1,3000)

            # Ensure the combination is unique
            combination = (subject_id, date_id,transaction_id,partner_id)
            if combination not in unique_combinations:
                unique_combinations.add(combination)
                break

        # Generate a random grade
        grant_amount = round(random.uniform(1, funding_max - 0.01), 1)

        # Write the row to the file
        file.write(f"{subject_id},{date_id},{transaction_id},{partner_id},{grant_amount}\n")