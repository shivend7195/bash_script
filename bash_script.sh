#!/bin/bash


echo "😎 Hello User let's build a script😎"

#   to determine the version
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline


version=${splitfirstline[1]}
echo "You are building version $version"


echo "Hey, hit 1 to continue or hit 0 to exit"
read versioncontinue


if [ $versioncontinue -eq 1 ]; then
    echo "OK"

   
    for filename in source/*; do 
        echo $filename

      
        if [ $filename == "source/secretinfo.md" ]; then
            echo "NOT COPYING" $filename
        else
            echo "COPYING FILE" $filename
            
            cp $filename build/
        fi
    done
else
    echo "Please come back when you are ready"
fi

cd build


echo "Build version $version contains:"
ls

# Change back to the previous directory
cd ..
