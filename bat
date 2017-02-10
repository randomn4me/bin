#!/bin/bash

usage() {
	cat <<EOF
usage: $(basename $0) [-hls]
	-h : print this help
	-l : print battery percentage (default)
	-s : print battery state
EOF
}

level () {
	printf "%s\n" "${BATC}"
}

state () {
	printf "%s\n" "${BATS}"
}

BATN=$(ls /sys/class/power_supply/ | grep BAT)

test -z "$BATN" && exit 1

BATC=$(cat /sys/class/power_supply/${BATN}/capacity)
BATS=$(cat /sys/class/power_supply/${BATN}/status)

case $1 in
	-h) usage ;;
	-s) state ;;
	 *) level ;;
esac
