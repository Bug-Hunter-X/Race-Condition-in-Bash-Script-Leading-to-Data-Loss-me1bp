# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script. Two processes attempt to write to the same file concurrently, resulting in unpredictable and potentially data loss. The solution provides a mechanism to prevent this by using a lock file to ensure exclusive access.