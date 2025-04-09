#!/bin/bash

sf="files"

if [[ ! -d "$sf" ]]; then
    exit 1
fi

for file in "$sf"/*; do
    if [[ -f "$file" ]]; then
        bn=$(basename "$file")
        
        fc=$(echo "${bn:0:1}" | tr '[:upper:]' '[:lower:]')
        
        if [[ "$fc" =~ [a-z] ]]; then
            mkdir -p "$fc"
            
            mv "$file" "$fc/"
        fi
    fi
done
