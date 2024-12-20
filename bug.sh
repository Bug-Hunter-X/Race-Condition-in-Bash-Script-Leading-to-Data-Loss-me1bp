#!/bin/bash

# This script demonstrates a race condition that can lead to unexpected behavior.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes that simultaneously write to the same file.
(echo "Process 1 writing to file1.txt" > file1.txt &)
(echo "Process 2 writing to file1.txt" > file1.txt &)

# Wait for the processes to finish.
wait

# Print the content of the file.
cat file1.txt

# The output is not deterministic: only one of the messages will be in the file