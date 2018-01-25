#!/bin/bash

#This script will install and configure a csgo surf server, with all of the mods needed to run the server
#This server used ckSurf, UMC Mapchooser and a FastDL
#This script needs to be exacted as root

### Checks for root user ###
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "

"
sleep 0.2
clear
sleep 1

echo "This is a script made by AcidzDesigns
This script will install a CS:GO surf server, the server requires a SQL database for surf times and user levels.
If you do not have these requirements install on your linux server then please use my other script to install these requirements"

echo "

"

while true; do
    read -p "Do you wish to install these requirements? [Y/N]" yn
    case $yn in
        [Yy]* ) wget https://raw.githubusercontent.com/AcidzDesigns/Linux-WebServer-Script/master/Webserver_Installation_Script.sh
		chmod +x WebServer_Installation_Script.sh 
		./WebServer_Installation_Script.sh; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sleep 1
clear
sleep 0.2

echo "Installing the CS:GO Installation script

I will need some information from you before we begin"

read -p "Please enter your desired csgosurf account username:  " USER
echo $USER
read -p "Please enter your desired csgosurf account password:  " PASS
echo $PASS

adduser $USER
passwd $USER $PASS
su - $USER

sleep 1
clear
sleep 1

echo "Downloading the LGSM Server install script"

wget -N --no-check-certificate https://gameservermanagers.com/dl/linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver

sleep 1
clear 

echo "Please follow all of the on-screen instructions that will be provided on screen"
read -p "When you are you ready to begin the server install press [ENTER]" 
sleep 1

./cssgoserver install


wait
sleep 0.5
clear 
sleep 0.5

echo "Now this script will download and install ckSurf, UMC MapChooser, Metamod and SourceMod"

echo "Thank you for using this script, and I hope everything has installed successfully"
sleep 1
clear



 
