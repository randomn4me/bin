#!/bin/sh

which pacmd > /dev/null || (echo 'not installed' && exit)

CARD_ID="$(pacmd list-cards | grep index | tail -n1 | sed 's/.*: \(.*\)/\1/p;d')"

usage() {
	echo "Usage $(basename $0): <h|a>"
}

case $1 in
	h)	pacmd set-card-profile $CARD_ID headset_head_unit ;;
	a)	pacmd set-card-profile $CARD_ID a2dp_sink ;;
	*)	usage ;;
esac

