#!/bin/bash

# Check if there are two arguments
if [ "$#" -ne 2 ]; then
        echo "There should be two arguments: <source_dir> <destination_dir>"
        echo "Enter right arguments"
        exit 1
fi

# Check existence of source directory
if [ ! -d "$1" ]; then
        echo "Source directory '$1' does not exist"
        exit 1
fi

#Create destination directory
mkdir -p "$2"

# Timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup source dir
tar -czf "$2/backup_$timestamp.tar.gz" -C "$1" .

echo " Backup has been created: $2/backup_$timestamp.tar.gz"

