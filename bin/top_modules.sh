#!/bin/bash

# Specify the directory containing your JavaScript code
code_directory="src"

# Find all JavaScript files in the specified directory
js_files=$(find "$code_directory" -type f -name "*.tsx")

# Use grep to extract import statements and then sed to extract the module names
# imported_modules=$(
#   grep -h -E '^\s*import .* from|^\s*import .*;' $js_files |
#   sed -E 's/^\s*import\s*|\s*from\s*|\s*;.*$//g' |
#   grep -oE '\b[A-Za-z0-9_]+\b' |
#   grep -v '^$'
# )

# Use grep to extract import statements and then sed to extract the module names
imported_modules=$(grep -h -E '^\s*import .* from|^\s*import .*;' $js_files | sed -E 's/^\s*import\s*|\s*from\s*|\s*;.*$//g')


# Use sort and uniq to count the occurrences of each module and sort them
sorted_modules=$(echo "$imported_modules" | sort | uniq -c | sort -nr)

# Print the top 10 most imported modules
echo "$sorted_modules" | head -n 10

