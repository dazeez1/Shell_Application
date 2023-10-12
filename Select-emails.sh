#!/bin/bash
grep -oE '^[^,]+' "student-list_0923.txt" > "student-emails.txt"
