#!/bin/bash

#mx-fluxbox-install

##ASSUMPTIONS##idesktop

#1) that fluxbox and idesk have been installed
#2) that this script has been placed in /usr/bin/mxflux/
#3) that the tarball from https://github.com/jerry3904/mx-fluxbox has been extracted and placed in 
#/usr/share/mxflux/

TEXTDOMAINDIR=/usr/share/locale 
export TEXTDOMAIN="mx-fluxbox"

MESSAGE=$"This will install into your Home folder components that MX-flux requires in order to run.  Any existing fluxbox configuration will be backed up as <i>$HOME/.restore/fluxbox/fluxbox_BAK</i>."
END_MSG=$"To start a fluxbox session: log out, select <i>fluxbox</i> from the pull-down menu in the upper right corner, and log back in."

##begin message box
yad --text="


<b>$MESSAGE</b>" --title=$"OK to proceed?" --window-icon=/usr/share/icons/mxflux.png --geometry=400x40 --text-align=center 
##end message box

if [ ! "$?" = "0" ]; then
    exit 0
fi

#set up fluxbox

if [ ! -d "$HOME/.restore/fluxbox" ]; then
	mkdir -p "$HOME/.restore/fluxbox"
fi

if [ -d "$HOME/.fluxbox" ]; then
    mv $HOME/.fluxbox $HOME/.restore/fluxbox/fluxbox_bak_.$(date +%Y%m%H%M%S) 
fi

if [ ! "$?" = "0" ]; then
	exit 1
fi

cp -r /usr/share/mxflux/.fluxbox "$HOME"

#setup default translated mx-fluxbox menu

localize_fluxbox_menu-mx

#set up idesk

if [ -d "$HOME/.idesktop/" ]; then
    mv "$HOME/.idesktop" "$HOME/.restore/fluxbox/idesktop_.$(date +%Y%m%H%M%S)"
    mv $HOME/.ideskrc $HOME/.restore/fluxbox/ideskrc_.$(date +%Y%m%H%M%S)
fi

if [ ! -d "$HOME/.idesktop/" ]; then
	mkdir -p "$HOME"/.idesktop/
fi

cp /etc/skel/.idesktop/*.lnk "$HOME"/.idesktop

cp /etc/skel/.ideskrc "$HOME"/.ideskrc

cp /usr/share/mxflux/.fluxbox/components/.fehbg "$HOME"/.fehbg

#install volumeicon file
#only replace if it doesn't exist
if [ ! -e "$HOME/.config/volumeicon/volumeicon-fluxbox" ]; then
	cp /etc/skel/.config/volumeicon/volumeicon-fluxbox "$HOME/.config/volumeicon/"
fi


#set up the system monitors
cp -r /usr/share/mxflux/.fluxbox/components/.gkrellm2 "$HOME"/.gkrellm2

sleep 2


#start concluding message
yad --text="


<b>$END_MSG</b>" --title=$"All done!" --window-icon=/usr/share/icons/mxflux.png --geometry=400x40 --text-align=center 
#end concluding message
