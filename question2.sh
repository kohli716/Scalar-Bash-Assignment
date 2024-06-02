#!/bin/bash
 
 # Check for directory argument
 if [ "$#" -ne 1 ]; then
     echo "Usage: $0 <directory>"
     exit 1
 fi
 
 DIRECTORY=$1
 
 # Check if the directory exists
 if [ ! -d "$DIRECTORY" ]; then
     echo "The specified directory does not exist."
     exit 1
 fi
 
 # Traverse the directory recursively and count file types
 echo "File Type Counts in '$DIRECTORY':"
 find "$DIRECTORY" -type f | sed -n 's/.*\.//p' | sort | uniq -c | sort -nr | while read count ext; do
     printf "%-5s %s\n" "$count" ".$ext"
 done
 
 exit 0