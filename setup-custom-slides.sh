#!/bin/bash

#INSTALLPATH="/home/pi/"
INSTALLPATH=$HOME"/"

#Add custom slides file to startup
echo "${yellow}Adding Custom Slides to Startup via pixelcade-custom-slides.service...${white}"
wget -O ${INSTALLPATH}pixelcade/system/autostart-pixelcade-custom-slides.sh https://raw.githubusercontent.com/alinke/pixelcade-linux-builds/main/system/autostart.sh
wget -O ${INSTALLPATH}pixelcade/system/pixelcade-custom-slides.service https://raw.githubusercontent.com/alinke/pixelcade-linux/main/system/pixelcade.service
#sudo chmod +x ${INSTALLPATH}pixelcade/system/autostart-pixelcade-custom-slides.sh # TO DO need to replace this
sudo cp ${INSTALLPATH}pixelcade/system/pixelcade-custom-slides.service /etc/systemd/system/pixelcade-custom-slides.service

#to do add check if the service is already running
sudo systemctl start pixelcade-custom-slides.service
sudo systemctl enable pixelcade-custom-slides.service
