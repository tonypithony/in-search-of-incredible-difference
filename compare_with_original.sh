#!/usr/bin/env bash
files=( *jpg)

name='6.jpg'

# iterate over them # AE: That will return a value to the terminal, which is the count.
for file in "${files[@]}"; do
    var=$(compare -metric AE $name $file null: 2>&1)
    var1=$(perceptualdiff $name $file) 
    $(compare -compose src $name $file ${file:0:-4}_difference.png)
    #echo "for $file diffpxls = $var"
    echo "for $file visibly different = $var1"
    echo "for $file visibly different = $var1" >> resultscompare.txt
    #echo "for $file diffpxls = $var" >> compareresults.txt
done
