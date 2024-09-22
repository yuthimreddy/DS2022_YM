#!/bin/bash

curl -O https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz
tar -xzvf lab3-bundle.tar.gz

# tr can remove spaces
cat lab3_data.tsv | tr -s '\n' > my_new_file.tsv

# 5. 
# Convert Delimiters
# To convert TSV to CSV, or vice versa, use a text search+replace
# function such as `awk`, `tr`, or a good IDE/text editor:

# Use `tr` - "translate"
tr '\t' ',' < my_new_file.tsv > file.csv

#6. Counting how many lines of code
line_count=$(($(wc -l < file.csv)-1))
echo $line_count

#creating new tarball
tar -czf cleaned_file.tar.gz file.csv
