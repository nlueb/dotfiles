# xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144
xrandr --fb 6913x2160 --dpi 138 \
	--output DisplayPort-1 --mode 2560x1440 --rate 144 --scale 1.2x1.2 --pos 3840x360 \
	--output DisplayPort-0 --mode 3840x2160 --rate 60 --pos 0x0 --primary &
# xrandr --fb 6400x3600 --dpi 138 \
# 	--output DisplayPort-1 --mode 2560x1440 --rate 144 --scale 1.2x1.2 --pos 3840x720 --panning 2560x1440+3840+720 \
# 	--output DisplayPort-0 --mode 3840x2160 --rate 60 --pos 0x0 --panning 3840x2160+0+0 --primary &
# xrandr --dpi 138 --output DisplayPort-1 --mode 3840x2160 --rate 60 --primary &
#xrandr --fb 5760x2160 --dpi 138 \
#	--output DVI-D-1 --mode 1920x1080 --rate 144 --pos 0x540 --scale 0.5x0.5 --panning 1920x1080+0+540 \
#	--output DP-2 --mode 3840x2160 --rate 60 --pos 1920x0 --panning 3840x2160+1920+0 --primary
# feh --bg-scale ~/Wallpapers/macos-big-sur-apple-layers-fluidic-colorful-wwdc-stock-2020-4096x2304-1455.jpg
hsetroot -solid '#000000' &
setxkbmap eu &
# picom &
dunst &
exec bspwm
