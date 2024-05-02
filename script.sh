#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Что куда копировать?: $0 <директория-источник> <директория-назначение>"
    exit 1
fi

source_dir="$1"
dest_dir="$2"

mkdir -p "$dest_dir"

for file in $(find "$source_dir" -type f); do
    base_name=$(basename "$file")
    target_file="$dest_dir/$base_name"
    
    if [ -f "$target_file" ]; then
        num=1
        while [ -f "$dest_dir/${base_name%.*}_$num.${base_name##*.}" ]; do
            num=$((num + 1))
        done
        target_file="$dest_dir/${base_name%.*}_$num.${base_name##*.}"
    fi
    
    cp "$file" "$target_file"
done

echo "Файлы успешно скопированы из $source_dir в $dest_dir."
