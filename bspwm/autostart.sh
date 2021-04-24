#MONITORS
#Configure Acer monitor to be 240 hz
xrandr --output DP-2 --mode 1920x1080 --rate 240
#Configure Acer monitor to be on the left of my samsung monitor
xrandr --output DP-2 --left-of HDMI-0

#BACKGROUND
#Setting the wallpaper using feh
feh --randomize --bg-scale ~/Pictures/wallpapers/*
