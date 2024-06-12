#!/bin/bash

FRUITS=("Apple" "Banana" "Mango" "Pineapple" "Watermelon")

echo "The first is: ${FRUITS[0]}"
echo "The first is: ${FRUITS[1]}"
echo "The first is: ${FRUITS[2]}"
echo "The first is: ${FRUITS[3]}"
echo "The first is: ${FRUITS[4]}"

#To print all at once
echo "+++++++++++++++++++++++++++"
echo "The first is: ${FRUITS[@]}"