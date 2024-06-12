#!/bin/bash

NUM=$1

if [ $NUM -gt 100 ];
then
    echo "The number $NUM is greater than 100"
else
    echo "The number $NUM is lesser than 100"
fi