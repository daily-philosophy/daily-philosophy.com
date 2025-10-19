#!/bin/bash

for i in [0-9A-Za-z]*/ DRAFT-[0-9A-Za-z]*/;
do
    cd $i
    if [ -s featured.jpg ]
    then
	if [ ! -s featured.webp ]
	then
	    echo "$i: JPG->WEBP"
	    convert featured.jpg -resize 500x500\> featured-500px.jpg
	    convert featured.jpg -resize 500x500\> featured-500px.webp
	    convert featured.jpg -resize 800x800\> featured-800px.jpg
	    convert featured.jpg -resize 800x800\> featured-800px.webp
	    convert featured.jpg -resize 1200x\> featured-1200px.jpg
	    convert featured.jpg -resize 1200x\> featured-1200px.webp
	    convert featured.jpg featured.webp
	    cp featured-1200px.jpg featured-top.jpg
	fi
    fi

    if [ -s featured.jpeg ]
    then
	echo "$i: JPEG->WEBP"
	mv featured.jpeg featured.jpg
	convert featured.jpg -resize 500x500\> featured-500px.jpg
	convert featured.jpg -resize 500x500\> featured-500px.webp
	convert featured.jpg -resize 800x800\> featured-800px.jpg
	convert featured.jpg -resize 800x800\> featured-800px.webp
	convert featured.jpg -resize 1200x\> featured-1200px.jpg
	convert featured.jpg -resize 1200x\> featured-1200px.webp
	convert featured.jpg featured.webp

    fi
    if [ ! -s featured.jpg ]
    then
	if [ -s featured.webp ]
	then
	    echo "$i: WEBP->JPG"
	    convert featured.webp -resize 500x500\> featured-500px.jpg
	    convert featured.webp -resize 500x500\> featured-500px.webp
	    convert featured.webp -resize 800x800\> featured-800px.jpg
	    convert featured.webp -resize 800x800\> featured-800px.webp
	    convert featured.webp -resize 1200x\> featured-1200px.jpg
	    convert featured.webp -resize 1200x\> featured-1200px.webp	    
	    convert featured.webp featured.jpg
	fi
    fi

    if [ ! -s featured-thumbnail.jpg ]
    then
	echo "$i: JPEG thumbnail"
	convert featured.jpg -resize 300x200\> featured-thumbnail.jpg
	convert featured.jpg -resize 300x200\> featured-thumbnail.webp	
    fi
    rm -f index.md.~*
    cd ..
done

