#!/bin/bash
 
# Dependencies:
# ffmpeg
# i3lock-color-git

source $COLOR_FILE
 
IMAGE=/tmp/i3lock.png
TMP_LOCK=/tmp/tmp_lock.png
LOCK=~/.config/lockicon.png
RES=$(xrandr --current | grep '*' | uniq | awk '{print $1}')

convert $LOCK -fill $color1 +opaque none $TMP_LOCK

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $TMP_LOCK -filter_complex "boxblur=20,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $IMAGE

i3lock --textcolor="${fg}ff" --insidecolor="${bg}1c" --ringcolor="${fg}aa" --linecolor=00000000 --keyhlcolor="#f719611f" --ringvercolor=00ff0030 --insidevercolor=0000001c --ringwrongcolor=ff000030 --insidewrongcolor=0000001c -i $IMAGE

rm $IMAGE $TMP_LOCK
