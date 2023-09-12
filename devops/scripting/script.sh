#!/bin/sh
#!/bin/bash

cd "$(dirname "$0")"
input_file="manifest.json"

jq -r ' .[].filename' "$input_file" |
while IFS= read -r file_name; do
    [[ -f "$file_name" ]] && echo "This file does exist!"
    echo "filename: $file_name"
done