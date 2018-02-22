#!/usr/bin/fish

gtf 2560 1440 59.9
xrandr --newmode 2560x1440_59.90  311.31  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync
xrandr --addmode eDP-1-1 2560x1440_59.90
xrandr --output eDP-1-1 --primary --mode 2560x1440_59.90 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --mode 1920x1200 --pos 2560x112 --rotate normal --output HDMI-1-2 --mode 1920x1080 --pos 4480x176 --rotate normal
