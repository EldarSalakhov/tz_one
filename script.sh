#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Что куда копировать?: $0 < директория - источник > < директория - назначение >"
    exit 1
fi

s="$1"
d="$2"

mkdir -p "$d"

for f in $(find "$s" -type f); do
    b=$(basename "$f")
    t="$d/$b"
    
    if [ -f "$t" ]; then
        n=1
        while [ -f "$d/${b%.*}_$n.${b##*.}" ]; do
            n=$((n + 1))
        done
        t="$d/${b%.*}_$n.${b##*.}"
    fi
    
    cp "$f" "$t"
done

echo "Файлы успешно скопированы из $s в $d."
