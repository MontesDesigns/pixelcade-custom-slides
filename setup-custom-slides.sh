#!/bin/bash

#INSTALLPATH="/home/pi/"
INSTALLPATH=$HOME"/"

#Add custom slides file to startup
echo "${yellow}Adding Custom Slides to Startup via pixelcade-custom-slides.service...${white}"
wget -O ${INSTALLPATH}pixelcade/system/autostart-pixelcade-custom-slides.sh https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/system/autostart-pixelcade-custom-slides.sh
wget -O ${INSTALLPATH}pixelcade/system/pixelcade-custom-slides.service https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/system/pixelcade-custom-slides.service
sudo chmod +x ${INSTALLPATH}pixelcade/system/autostart-pixelcade-custom-slides.sh # TO DO need to replace this
sudo cp ${INSTALLPATH}pixelcade/system/pixelcade-custom-slides.service /etc/systemd/system/pixelcade-custom-slides.service
