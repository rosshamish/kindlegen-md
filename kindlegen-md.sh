#!/bin/bash

if [[ -z ${1+x} || -z ${2+x} || $1 = '--help' || $1 = '-h' ]]; then
	echo 'Usage: sh ./kindlegen-md.sh notes-dir kindle-volume [filename-prefix]'
	exit -1
fi

NOTES_DIR=$1
KINDLE_DOCUMENTS=$2/documents
if [ $3 ]; then
	PREFIX=$3_
else
	PREFIX=''
fi

mkdir -p "$KINDLE_DOCUMENTS"
cd "$NOTES_DIR"
for f in *.{md,txt}; do
	if [[ ! -e "$f" ]]; then continue; fi
	pandoc "$f" -s -o "$f.html"
	kindlegen "$f.html" -o "$PREFIX$(basename $f).mobi" > /dev/null
	mv "$PREFIX$(basename $f).mobi" "$KINDLE_DOCUMENTS"
	rm "$f.html"
	echo "...Sent $f to $KINDLE_DOCUMENTS/$f.mobi"
done
