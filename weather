#!/bin/bash

usage() {
	cat << EOF
usage: weather <city>
EOF
}


getdata() {
	curl -s "wttr.in/$1?Q2F"
}

test $# -lt 1 && usage && exit 1

getdata $1

