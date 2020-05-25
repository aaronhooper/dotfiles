#!/bin/sh
# dwm init script
# This is made selectable in LightDM by adding a .desktop file in
# `/usr/share/xsessions`.

compton &
redshift &
slstatus &
exec /usr/local/bin/dwm
