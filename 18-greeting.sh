#!/bin/bash

NAME=""
WISHES=""

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo " -n The name should be specified"
    echo " -w The wishes shoudl be specified"
    echo " -h Display Help and exit"
}

while getopts "n:w:h" opt
do
    case $opt in
        n) NAME="$OPTARG";;
        W) WISHES="$OPTAGR";;
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        :) USAGE; exit;;
        h) USAGE; exit;;
    esac
done

if [ -z "$NAME" ] || [ -z "$WISHES" ] 
then
    #echo "ERROR: Both -n and -w are mandatory options."
    echo "ERROR: -n and -w is mandatory."
    USAGE
    exit 1
fi

echo "Hello $NAME. $WISHES. I have been learning Shell Script."

