#!/bin/sh

# This script can be used to generate PNGs from the SVGs stored in orig/.
# For each SVG in orig/, PNGs will be created in the drawable directories
# for each DPI with the same name as the SVG. If the PNGs already exist
# and are newer than the SVG, they will not be recreated.
#
# Requires:
# - inkscape
# - imagemagick
# - optipng

gen() {
	name=`basename "$1" .svgz`
	png="app/src/main/res/drawable-$2/$name.png"
	if [ "$1" -nt "$png" -o ! -e "$png" ]; then
		inkscape --without-gui --export-area-page --export-dpi=$3 --export-png="$png" $1
		echo
	fi
}

for i in orig/*.svgz; do
	gen "$i" mdpi 96
	gen "$i" hdpi 144
	gen "$i" xhdpi 192
	gen "$i" xxhdpi 288
done

# GOOG tells us to use xxx-hdpi only for launcher icons
gen "orig/icon.svgz" xxxhdpi 384
