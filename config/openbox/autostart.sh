xset +dpms
xset r rate 500 30
xset m 3/2 5
setxkbmap -option caps:super
setxkbmap -model pc105 -layout "us,ru" -option "grp:alt_shift_toggle"
xrdb ~/.Xresources

compton -bcCG # --shadow-exclude '!focused' 
pcmanfm --desktop &
urxvtd -q -o -f &
tint2 &
