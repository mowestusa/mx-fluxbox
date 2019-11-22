##this script will set up fluxbox on the MX installation
##right-click the downloaded script > Properties > Permissions
##and check the box Allow to run as a program

sudo apt install fluxbox idesk

rm ~/.fluxbox ~/.idesktop/default.lnk

wget https://github.com/jerry3904/mx-fluxbox/archive/master.zip -P ~/Downloads/

cd ~/Downloads/	

unzip -d ~/ master.zip

mv mx-fluxbox-master/ ~/.fluxbox/

cp ~/.fluxbox/components/idesk/fluxhelp.lnk ~/.idesktop/

mv ~/.fluxbox/components/idesk/.ideskrc ~/.ideskrc

mv ~/.fluxbox/components/.fehbg ~/.fehbg

mv ~/.fluxbox/components/MX-BritPanel/conkyrc_fb ~/.conky/MX-BritPanel/conkyrc_fb

mv ~/.fluxbox/components/conky-startup.sh ~/.conky/conky-startup.sh



sleep 5

killall idesk

yad --text="To see the result: log out, select fluxbox from the pull-down menu in the upper right corner, and log back in." --title="All done!" --width=400 
