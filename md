#!/bin/sh

usage() {
    printf "Usage: $(basename $0) <file>\n"
}

test ! -f "$1" && usage && exit 1

markdown_py "$1" | w3m -T text/html
