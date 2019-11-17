# mx-fluxbox
This fluxbox version is a Window Manager designed to be used on MX Linux. It is fully integrated with Xfce4, creating an easily configurable product. 

STATUS: beta

DEPENDENCIES: idesk, MX-19 (only version tested so far)

INSTALLATION: it will eventually be available as a deb file installed via MX Package Installer. These directions are aimed at 

1) install fluxbox and idesk

sudo apt install fluxbox idesk

2) download the tarball .fluxbox.tar.gz and extract to /home, accepting to replace all

3) open terminal inside .fluxbox and move components

mv ~/.fluxbox/mxf/idesk/fluxhelp.lnk ~/.idesktop/
mv ~/.fluxbox/mxf/idesk/.ideskrc ~/
mv ~/.fluxbox/mxf/BritPanel/conkyrc_fb ~/.conky/MX-BritPanel/
mv ~/.fluxbox/mxf/conky-startup.sh ~/.conky/

4) log out of Xfce, select fluxbox as the session, and log back in 
