#!/bin/bash

source_folder="files"

if [[ ! -d "$source_folder" ]]; then
    echo "Error: The 'files' folder does not exist in the current directory."
    exit 1
fi

for file in "$source_folder"/*; do
    if [[ -f "$file" ]]; then
        base_name=$(basename "$file")
        
        first_char=$(echo "${base_name:0:1}" | tr '[:upper:]' '[:lower:]')
        
        if [[ "$first_char" =~ [a-z] ]]; then
            mkdir -p "$first_char"
            
            mv "$file" "$first_char/"
        fi
    fi
done

echo "Files have been successfully organized into folders based on their names."
