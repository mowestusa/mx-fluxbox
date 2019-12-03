#!/bin/bash

#mx-fluxbox-install

##ASSUMPTIONS##
#1) that fluxbox and idesk have been installed
#2) that this script has been placed in /usr/bin/mxflux/
#3) that the tarball from https://github.com/jerry3904/mx-fluxbox has been extracted and placed in 
#/usr/share/mxflux/

TEXTDOMAINDIR=/usr/share/locale 
export TEXTDOMAIN="mxflux"

MESSAGE=$"This will install into your Home folder components that MX-flux requires in order to run.  Any existing fluxbox configuration will be backed up as <i>fluxbox_BAK</i>."
END_MSG=$"To start a fluxbox session: log out, select <i>fluxbox</i> from the pull-down menu in the upper right corner, and log back in."

##begin message box
yad --text="


<b>$MESSAGE</b>" --title=$"OK to proceed?" --window-icon=/usr/share/icons/mxflux.png --geometry=400x40 --text-align=center 
##end message box

if [ ! "$?" = "0" ]; then
    exit 0
fi

#set up fluxbox

if [ -d "$HOME/.fluxbox" ]; then
    mv $HOME/.fluxbox $HOME/.fluxbox_BAK
fi

cp -r /usr/share/mxflux/.fluxbox "$HOME"

#set up idesk

if [ ! -d "$HOME/.idesktop/" ]; then
    mkdir -p "$HOME"/.idesktop/
fi

cp /usr/share/mxflux/.fluxbox/components/idesk/fluxhelp.lnk "$HOME"/.idesktop/fluxhelp.lnk

cp /usr/share/mxflux/.fluxbox/components/idesk/.ideskrc "$HOME"/.ideskrc

cp /usr/share/mxflux/.fluxbox/components/.fehbg "$HOME"/.fehbg

#set up the conky

if [ ! -d "$HOME/.conky/MX-BritPanel/" ]; then
    mkdir -p "$HOME/.conky/MX-BritPanel/"
fi

cp /usr/share/mxflux/.fluxbox/components/MX-BritPanel/conkyrc_fb "$HOME"/.conky/MX-BritPanel/conkyrc_fb

sleep 2

#start concluding message
yad --text="


<b>$END_MSG</b>" --title=$"All done!" --window-icon=/usr/share/icons/mxflux.png --geometry=400x40 --text-align=center 
#end concluding message
