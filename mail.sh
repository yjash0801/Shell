#!/bin/bash
TO_TEAM=$1
ALERT=$2
BODY=$3
ESCAPE_BODY=$(printf '%s\n' "$BODY" | sed -e 's/[]\/$*.^[]/\\&/g');
SUBJECT=$4
TO_ADDRESS=$5


FINAL_BODY=$(sed -e "s/TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT/g" -e "s/BODY/$ESCAPE_BODY/g" template.html)

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"