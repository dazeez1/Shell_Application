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

# Function to view all students
view_all_students() {
    cat students-list_0923.txt
}

# Function to delete a student by student ID
delete_student() {
    echo "Enter student ID to delete:"
    read student_id
    sed -i "/$student_id/d" students-list_0923.txt
}

# Function to update a student record by student ID
update_student() {
    echo "Enter student ID to update:"
    read student_id
}

# Function to exit the application
exit_application() {
    echo "Exiting the application. Goodbye!"
    exit 0
}

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
        2) view_all_students ;;
        3) delete_student ;;
        4) update_student ;;
        5) exit_application ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
