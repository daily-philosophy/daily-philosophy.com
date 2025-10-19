#!/bin/bash

for i in *
do
    if [ -d $i ]
    then
	if [ -f $i/index.de.md ]
	then
	    if [ ! -f $i/featured-1200px.jpg ]
	    then
		echo "Creating 1200px image in $i"
		convert $i/featured.jpg -scale 1200x $i/featured-1200px.jpg
		convert $i/featured.jpg -scale 1200x $i/featured-1200px.webp
	    fi
	fi
    fi
done
