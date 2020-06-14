#!/bin/bash

# rename files in a directory
# arg 1: path to directory with files

cd "$1"
num=1
newname_base="newfile"

for filename in *; do
    extension="${filename##*.}" 
    newname="$newname_base-$num.$extension"
    echo "OLD: $filename"
    echo "new: $newname"  
    mv -n "$filename" "$newname"
    (( num++ ))
done
