#! /bin/bash

# setting refresh rate and resolution
xrandr --output HDMI-0 --mode 1920x1080 --rate 239.76

# setting wallpaper
nitrogen --restore

# Check if picom is running & run if not
pgrep -u "$USER" -x picom >/dev/null || picom &
