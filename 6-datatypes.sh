#!/bin/bash

NUM1=$1
NUM2=$2

SUM=$(echo "$NUM1+$NUM2" | bc)

echo "Addition of 2 number: $SUM | bc"