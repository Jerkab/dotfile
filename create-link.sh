#!/bin/sh

DIRBASE=`cd $(dirname $0) && pwd`

function mylink {
    name=$1;
    fname=$DIRBASE/$name
    if [ -f $fname ]; then
	hname=`echo $name | sed -e s/dot././`
	if [ -e "$HOME/$hname" ]; then
	    echo "IGNORE: File $HOME/$hname already exist"
	else
	    #ln -s $fname $HOME/$hname
	    echo "INFO: Create link $HOME/$hname"
	fi
    else
	echo "IGNORE: $fname is not a file."
    fi
}

# List dot files
DOTFILES=`cd $DIRBASE && ls -1 dot/*.el`
if [ -z "$DOTFILES" ]; then
    echo "ERROR: No dot file found"
    exit 1;
fi

for f in $DOTFILES; do
    mylink $f
done

exit 0
