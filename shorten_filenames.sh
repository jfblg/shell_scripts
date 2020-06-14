#!/bin/bash

# shorten files in a directory
# arg 1: path to directory with files

len=90
cd "$1"
num=""

for file in *; do
    newname="$file"
    echo "$file"
    until [[ ! -f "$newname" ]]; do
        (( sublen = len-1 - ${#num} ))
        printf -v newname '%.*s%d' "$sublen" "$file" "$num"
        (( num++ ))
        if [[ "${#file}" -gt $len+1 ]]; then
            mv -n "$file" "$newname"."$file##*.}"
        fi
    done
done
