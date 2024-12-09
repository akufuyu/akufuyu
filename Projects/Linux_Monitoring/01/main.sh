#!bin/bash

echo "Enter you name: "
read -r one

regex="^[a-zA-Z\s]+$"

if [[ $one == "" ]]; then
    echo "Enter cannot be empty."
elif [[ $one =~ [0-9] ]]; then
    echo "Incorrect input numbers cannot be entered."
elif [[ $one =~ $regex ]]; then
    echo "Hi, $one"
else
    echo "Incorrect input."
fi

