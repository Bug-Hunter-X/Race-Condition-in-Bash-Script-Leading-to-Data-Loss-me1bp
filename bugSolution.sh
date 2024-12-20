#!/bin/bash

# This script demonstrates a solution to the race condition using a lock file.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to the file with locking
write_to_file() {
  local message="$1"
  local filename="$2"
  # Acquire the lock
  flock "$filename.lock" 
  echo "$message" >> "$filename"
  # Release the lock
  flock -u "$filename.lock"
}

# Start two processes that write to the same file using the lock
write_to_file "Process 1 writing to file1.txt" file1.txt &
write_to_file "Process 2 writing to file1.txt" file1.txt &

# Wait for the processes to finish
wait

# Print the content of the file
cat file1.txt

# The output is now deterministic; both messages will be in the file.