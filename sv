#!/bin/sh

usage() {
	echo "$(basename $0) <0|1>"
	exit 1
}

lockon() {
	xss-lock -- slock &
	xautolock -corners '000-' -locker slock -time 5 -notify 30 -notifier 'notify "sleeping soon"' &
	notify 'screensaver on'
}

lockoff() {
	pkill xss-lock
	pkill xautolock
	notify 'screensaver off'
}

case "$1" in
	1) lockon ;;
	0) lockoff ;;
	*) usage ;;
esac
