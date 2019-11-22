##this script will set up fluxbox on the MX installation with MX defaults##

wget https://github.com/jerry3904/mx-fluxbox/archive/master.zip -P ~/Downloads/

cd ~/Downloads/	

unzip -d ~/ master.zip

cd ~/ && mv mx-fluxbox-master/ .fluxbox/

mv ~/.fluxbox/mxf/idesk/fluxhelp.lnk ~/.idesktop/

mv ~/.fluxbox/mxf/idesk/.ideskrc ~/

mv ~/.fluxbox/mxf/.fehbg ~/

mv ~/.fluxbox/mxf/MX-BritPanel/conkyrc_fb ~/.conky/MX-BritPanel/

mv ~/.fluxbox/mxf/conky-startup.sh ~/.conky/

rm  ~/.idesk/default.lnk

idesk

sleep 10

killall idesk
