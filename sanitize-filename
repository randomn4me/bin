#!/bin/sh

usage() {
    echo "Usage: $(basename $0) <file>"
}

test ! -f "$1" && usage && exit 1

SANITIZED="$(echo $1 | tr [A-Z_\ ] [a-z_\-])"
echo $SANITIZED

#mv "$1" $SANITIZED
