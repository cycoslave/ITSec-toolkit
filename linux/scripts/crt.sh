#!/bin/bash
# Built from a snipplet of Echelon.

if [ -z "$1" ]; then
	echo "ERROR: No domain provided!"
	Help
fi

curl -s https://crt.sh/\?q\=$1\&output\=json | jq .
