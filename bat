#!/bin/bash

usage() {
	cat <<EOF
usage: $(basename $0) [-hlst]
	-h : print this help
	-l : print battery percentage (default)
	-s : print battery state
	-t : print remaining time
EOF
}

level () {
	printf "%s\n" "${BATC}"
}

state () {
	printf "%s\n" "${BATS}"
}

resttime () {
	HOUR="$(( $BATEN / $BATPN ))"
	MIN=$(bc -l <<< "(($BATEN / $BATPN) - $HOUR) * 60")
	
	printf "%02d:%02.0f\n" "$HOUR" "$MIN"
}

BATN=$(ls /sys/class/power_supply/ | grep BAT)

test -z "$BATN" && exit 1

BATPATH="/sys/class/power_supply/$BATN"
BATC=$(cat $BATPATH/capacity)
BATS=$(cat $BATPATH/status)
BATEN=$(cat $BATPATH/energy_now)
BATPN=$(cat $BATPATH/power_now)

case $1 in
	-h) usage ;;
	-s) state ;;
	-t) resttime ;;
	 *) level ;;
esac
