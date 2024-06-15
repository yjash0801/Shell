#!/bin/bash

NAME=""
WISHES="Good Morning"

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo " -n The name should be specified"
    echo " -w The wishes shoudl be specified (Optional) default is Good Morning"
    echo " -h Display Help and exit"
}

while getopts ":n:w:h" opt; do
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        :) echo "Option -$OPTARG requires an argument." >&2; USAGE; exit 1;;
        h) USAGE; exit;;
    esac
done

#if [ -z "$NAME" ] || [ -z "$WISHES" ]
if [ -z "$NAME" ] 
then
    #echo "ERROR: Both -n and -w are mandatory options."
    echo "ERROR: -n and -w is mandatory."
    USAGE
    exit 1
fi

echo "Hello $NAME. $WISHES. I have been learning Shell Script."

