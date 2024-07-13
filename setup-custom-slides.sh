#!/bin/bash

#INSTALLPATH="/home/pi/"
INSTALLPATH=$HOME"/"

#Add custom slides file to startup
echo "${yellow}Adding Custom Slides to Pixelcade folder...${white}"

#Remove the old file if found in the pixelcade/system folder
cd ${INSTALLPATH}pixelcade/system && rm autostart-pixelcade-custom-slides.sh &

#Download the new file
wget -O ${INSTALLPATH}pixelcade/system/autostart-pixelcade-custom-slides.sh https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/system/autostart-pixelcade-custom-slides.sh

#Make sure it has execute permissions
sudo chmod +x ${INSTALLPATH}pixelcade/system/autostart-pixelcade-custom-slides.sh
echo "${yellow}Done adding Custom Slides to Pixelcade folder...${white}"

#Add task to crontab
echo "${yellow}Adding schedule task to Crontab...${white}"

# Define the cron job to add
cron_job="@reboot ${INSTALLPATH}pixelcade/system/autostart-pixelcade-custom-slides.sh"

# Add the cron job to crontab
(crontab -l ; echo "$cron_job") | crontab -

echo "Cron job added."
echo "Reboot pi to start Pixelcade Custom Slides"
