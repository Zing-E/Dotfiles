# If using Artix uncomment the pipewire commands

setxkbmap -variant dvorak
bash ~/.fehbg
unclutter &
#pipewire &
#pipewire-pulse &
#wireplumber &
picom --vsync --fade-in-step=1 --fade-out-step=1 &
bspwm
