##ASSUMPTIONS##
#1) that fluxbox and idesk have been installed
#2) that this script has been placed in /usr/bin/mxflux/
#3) that the tarball from https://github.com/jerry3904/mx-fluxbox has been extracted and placed #in /usr/share/mxflux/

##begin message box
yad --text="


<b>This will install into your Home folder components that MX-flux requires in order to run.</b>" --title="OK to proceed?" --window-icon=/usr/share/icons/mxflux.png --geometry=400x40 --text-align=center 
##end message box

#set up fluxbox

mv /usr/share/mxflux/mx-fluxbox-master/ /usr/share/mxflux/.fluxbox/ 
 
cp /usr/share/mxflux/.fluxbox /home/$USER/.fluxbox

cp /usr/share/mxflux/.fluxbox/pixmaps/mxflux.png /usr/share/icons/

#set up idesk

mkdir /home/$USER/.idesktop/

cp /usr/share/mxflux/.fluxbox/components/idesk/fluxhelp.lnk /home/$USER/.idesktop/fluxhelp.lnk

cp /usr/share/mxflux/.fluxbox/components/idesk/.ideskrc /home/$USER/.ideskrc

cp /usr/share/mxflux/.fluxbox/components/.fehbg /home/$USER/.fehbg

#set up the conky

if [ ! -d "$HOME/.conky/" ]; then
    mkdir -p "$HOME/.conky/"
fi

if [ ! -d "$HOME/.conky/MX-BritPanel/" ]; then
    mkdir -p "$HOME/.conky/MX-BritPanel/"
fi

cp /usr/share/mxflux/.fluxbox/components/MX-BritPanel/conkyrc_fb /home/$USER/.conky/MX-BritPanel/conkyrc_fb

cp /usr/share/mxflux/.fluxbox/components/conky-startup.sh /home/$USER/.conky/conky-startup.sh

#start concluding message
yad --text="


<b>To start a fluxbox session: log out, select <i>fluxbox</i> from the pull-down menu in the upper right corner, and log back in.</b>" --title="All done!" --window-icon=/usr/share/icons/mxflux.png --geometry=400x40 --text-align=center 
#end concluding message
