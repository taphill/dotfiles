#!/bin/bash

# Find all files excluding the node_modules and .git directories, and sort them by size in descending order
files=$(
  find . \
  -type f \
  -not -path "./.git/*" \
  -not -path "./build/*" \
  -not -path "./dist/*" \
  -not -path "./node_modules/*" \
  -name "*.tsx" \
  -exec wc -l {} + |
  sort -nr
)

# Print the top N longest files (change N to your desired number)
N=20

# Use a counter to limit the loop to the top N files
counter=0
while IFS= read -r line; do
    if [ $counter -lt $N ]; then
        echo "$line"
        ((counter++))
    else
        break
    fi
done <<< "$files"

