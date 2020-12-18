# xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144
# xrandr --fb 5760x2160 --dpi 138 \
# 	--output DisplayPort-1 --mode 1920x1080 --rate 144 --pos 3840x540 --scale 1x1 --panning 1920x1080+3840+540 \
# 	--output DisplayPort-0 --mode 3840x2160 --rate 60 --pos 0x0 --panning 3840x2160+0+0 --primary &
xrandr --dpi 138 --output DisplayPort-1 --mode 3840x2160 --rate 60 --primary &
#xrandr --fb 5760x2160 --dpi 138 \
#	--output DVI-D-1 --mode 1920x1080 --rate 144 --pos 0x540 --scale 0.5x0.5 --panning 1920x1080+0+540 \
#	--output DP-2 --mode 3840x2160 --rate 60 --pos 1920x0 --panning 3840x2160+1920+0 --primary
feh --bg-scale ~/Wallpapers/macos-big-sur-apple-layers-fluidic-colorful-wwdc-stock-2020-4096x2304-1455.jpg
setxkbmap eu &
dunst &
exec bspwm
