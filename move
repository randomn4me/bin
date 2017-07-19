#!/bin/sh

# get current window id, width and height
WID=$(pfw)
WW=$(wattr w $WID)
WH=$(wattr h $WID)
WX=$(wattr x $WID)
WY=$(wattr y $WID)


# get screen width and height
ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

south() {
    wtp_xy $WX 
}

east() {
    wtp_xy $((SW - WW - GAPS - 2 * BORDER_WIDTH)) $WY
}

west() {
    wtp_xy $GAPS $WY
}

case $1 in
    c)
        WX=$(((SW - WW)/2))
        WY=$(((SH - WH)/2)) ;;
    tl)
        WX=$GAPS 
        WY=$((TOP_PADDING + GAPS)) ;;
    tr)
        WX=$((SW - WW - GAPS - 2 * BORDER_WIDTH))
        WY=$((TOP_PADDING + GAPS)) ;;
    bl)
        WX=$GAPS
        WY=$((SH - WH - GAPS - 2 * BORDER_WIDTH)) ;;
    br)
        WX=$((SW - WW - GAPS - 2 * BORDER_WIDTH))
        WY=$((SH - WH - GAPS - 2 * BORDER_WIDTH)) ;;
esac

wtp $WX $WY $WW $WH $WID
wmp -a $(( WX + WW / 2 )) $(( WY + WH / 2 ))
