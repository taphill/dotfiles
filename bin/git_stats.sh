#!/bin/bash

#
# Prints the number of lines of a file in each commit
#
# Usage: ./git_stats.sh <file_pattern>
#
# Examples:
#
# Show total number of lines of all code each commit
# ./git_stats.sh
# 
# Show total number of lines of javascript each commit
# ./git_stats.sh '.js'
#
# Show total number of lines of javascript and css each commit
# ./git_stats.sh '.js\|.css'
#
# Show total number of lines of a specific file each commit
# ./git_stats.sh 'src/main.js'
#

set -e

file_pattern=$1

function main() {
  for rev in $(revisions); do
    echo $(number_of_lines) $(commit_description)
  done
}

function revisions() {
  git rev-list --reverse HEAD
}

function commit_description() {
  git log --oneline -1 $rev
}

function number_of_lines() {
  git ls-tree -r $rev |
  grep "$file_pattern" |
  awk '{print $3}' |
  xargs git show |
  wc -l
}

main
