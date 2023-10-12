#!/bin/bash

students_file="students-list_0923.txt"

# Function to create a student record
create_student_record() {
    read -p "Enter student email: " email
    # Validate email format
    if [[ ! "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Invalid email format. Please enter a valid email."
        return 1
    fi
    
    read -p "Enter student age: " age
    # Validate age as a number
    if ! [[ "$age" =~ ^[0-9]+$ ]]; then
        echo "Invalid age. Please enter a valid age."
        return 1
    fi
    
    read -p "Enter student ID: " student_id
    # Validate student ID as a number
    if ! [[ "$student_id" =~ ^[0-9]+$ ]]; then
        echo "Invalid student ID. Please enter a valid ID."
        return 1
    fi
    
    echo "$email, $age, $student_id" >> "$students_file"
    echo "Student record created and saved."
}

# ... (other functions remain unchanged)

# Main application loop
while true; do
    echo "ALU Registration System"
    echo "1. Create student record"
    echo "2. View all student records"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) create_student_record ;;
        # ... (other cases remain unchanged)
        *) echo "Invalid choice. Please try again." ;;
    esac
done
