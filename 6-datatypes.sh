#!/bin/bash

NUM1=$1
NUM2=$2

SUM=$(echo "$NUM1 + $NUM2" | bc)

echo "Addition of 2 number: $SUM"

echo "How many args passed: $#"

echo "What are the agrs passed: $@"

echo "Script name:: $0"

echo "Script name:: $N"