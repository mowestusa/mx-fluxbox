sleep 20s
killall conky
cd "$HOME/.conky/MX-BritPanel"
conky -c "$HOME/.conky/MX-BritPanel/conkyrc_fb" &
