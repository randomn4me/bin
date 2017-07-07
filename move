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

RESIZE=0

wtp_xy() {
    wtp $1 $2 $WW $WH $WID
    wmp -a $1 $2
}

north() {
    wtp_xy $WX $((TOP_PADDING + GAPS)) 
}

south() {
    wtp_xy $WX $((SH -WH -GAPS - 2 * BORDER_WIDTH))
}

east() {
    wtp_xy $((SW - WW - GAPS - 2 * BORDER_WIDTH)) $WY
}

west() {
    wtp_xy $GAPS $WY
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
    n)  north ;;
    s)  south ;;
    w)  west ;;
    e)  east ;;
esac
