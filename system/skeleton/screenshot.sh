#!/bin/bash

LEFT=50
BOTTOM=50

FONTSIZE=56
FONT="/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf"
COLOR="green"
FILE=/tmp/screenshot.png

# get color list by typing on console: convert -list color
text="$(date '+%Y-%m-%d %H:%M:%S')"



# take screenshot
DISPLAY=:0 scrot -q1 $FILE

# check if screenshot was recorded successfully (is X running?)
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi


# do some calculations
hor=`identify -verbose $FILE | grep Geometry: | awk {'print $2'} |cut -d"x" -f 1`
ver=`identify -verbose $FILE | grep Geometry: | awk {'print $2'} |cut -d"x" -f 2`
X=$LEFT
Y=$(($ver - $BOTTOM))


# resize
mogrify -font $FONT \
	-pointsize $FONTSIZE -fill $COLOR \
	-draw "text $X, $Y '$text'" -resize '400x400' $FILE


# upload
URL=$(cat /etc/shinage-player/screenshot_url.conf)
UUID=$(cat /etc/shinage-player/uuid.conf)

curl \
  -F "screen=$UUID" \
  -F "image=@$FILE" \
  $URL


# cleanup
rm -f $FILE


