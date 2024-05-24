# wallpaper deamon initialisation 
swww init &

# start network manager applet
nm-applet --indicator &

# infobar
waybar -c ~/.config/waybar/leftbar/config -s ~/.config/waybar/leftbar/style.css &
waybar -c ~/.config/waybar/centerbar/config -s ~/.config/waybar/centerbar/style.css &
waybar -c ~/.config/waybar/rightbar/config -s ~/.config/waybar/rightbar/style.css &

# dunst notification deamon
dunst &

# mute audio on startup
# pactl set-sink-mute 0 true &

# set volume to 50% on startup
pactl set-sink-volume 0 50%

#mute microphone on startup
# pactl set-source-mute 0 true &

# sleep to give hyprland time to start
sleep 2

# Start the clipboard manager to listen
wl-paste --watch cliphist store &
wl-paste --watch sh ~/.scripts/clear-clipboard.sh &

# setting wallpaper
# swww img ~/.backgrounds/edger_lucy_neon.png &
swww img ~/.backgrounds/escape_velocity.png &



