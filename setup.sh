#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for F in $DIR/.*
do
	if [[ -f $F ]]; then
		FILENAME=${F##*/}
		echo Linking $FILENAME
		ln -s $F ~/$FILENAME
	fi
done
