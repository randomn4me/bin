#!/bin/sh

# get current window id, width and height
WID=$(pfw)
WW=$(wattr w $WID)
WH=$(wattr h $WID)

# get screen width and height
ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

wtp_xy() {
	wtp $1 $2 $WW $WH $WID
	wmp -a $1 $2
}

case $1 in
	c)
		wtp_xy $(((SW - WW)/2)) $(((SH - WH)/2))
		;;
	tl)
		wtp_xy $GAPS $((TOP_PADDING + GAPS))
		;;
	tr)
		wtp_xy $((SW - WW - GAPS - 2 * BORDER_WIDTH)) $((TOP_PADDING + GAPS))
		;;
	bl)
		wtp_xy $GAPS $((SH - WH - GAPS - 2 * BORDER_WIDTH))
		;;
	br)
		wtp_xy $((SW - WW - GAPS - 2 * BORDER_WIDTH)) $((SH - WH - GAPS - 2 * BORDER_WIDTH))
		;;
esac

