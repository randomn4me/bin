#!/bin/sh

usage() {
    echo "Usage: $(basename $0) <file>"
}

test ! -f $1 && usage && exit

filename="${1%.*}"
extension="${1##*.}"

# possible settings in quality order (top lowest, bottom highest)
# screen
# ebook
# printer
# prepress
# default

gs -sDEVICE=pdfwrite -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -sOutputFile="${filename}_reduced.${extension}" "$1"
