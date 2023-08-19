#!/bin/bash

usager() {
    echo "Usage: $(basename $0) <file>"
}

test ! -f $1 && usage
test ! -d av1 && mkdir av1

extension="${1##*.}"
filename="${1%.*}"

ffmpeg -i $1 -c:v libsvtav1 -preset 6 -crf 20 av1/$filename-av1.$extension
