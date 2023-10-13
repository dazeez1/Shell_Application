#!/bin/bash

# Remote server details
remote_host="2f05c1f8800b.3be8ebfc.alu-cod.online"
remote_username="2f05c1f8800b"
remote_password="d4a1d225d0abda9549d8"
remote_directory="/summative/0923-2023s"

# Source directory to back up
source_directory="negpod_18-q1"

# Rsync command to perform the backup
rsync -avz -e "sshpass -p $remote_password ssh -o StrictHostKeyChecking=no" "$source_directory" "$remote_username"@"$remote_host":"$remote_directory"/

echo "Backup completed to $remote_host:$remote_directory/$source_directory."
