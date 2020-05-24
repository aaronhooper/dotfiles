#!/bin/sh
# dwm init script
# This is made selectable in LightDM by adding a .desktop file in
# `/usr/share/xsessions`.

# Set title bar text.
while true; do
    xsetroot -name "$(date)"
    sleep 1
done &

compton &
redshift &
exec /usr/local/bin/dwm
