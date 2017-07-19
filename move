#!/bin/sh

usage() {
    printf "Usage: $(basename $0) <tl|tr|c|bl|br> <wid>\n"
    exit 1
}

test -n "$2" && WID=$2 || usage

# get current window id, width and height
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
        WX=$(((SW - WW) / 2))
        WY=$(((SH - WH) / 2)) ;;
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
    *)
        usage ;;
esac

wtp $WX $WY $WW $WH $WID
wmp -a $(( WX + WW / 2 )) $(( WY + WH / 2 ))
