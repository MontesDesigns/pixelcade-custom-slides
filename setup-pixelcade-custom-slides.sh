#!/bin/bash

# Script logic
black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
white=`tput setaf 7`
reset=`tput sgr0`
NEWLINE=$'\n'

# INSTALLPATH="/home/pi/"
INSTALLPATH=$HOME"/"

# Add custom slides file to startup
echo "${yellow}Adding Custom Slides to Pixelcade folder...${white}"

# Remove the old file if found in the pixelcade/system folder
echo "${yellow}Remove old file if found in the Pixelcade System folder...${white}"
cd ${INSTALLPATH}pixelcade/system && rm pixelcade-custom-slides.sh && rm pixelcade-custom-slides-settings.txt

# Download the Pixelcade Custom Slides shell
echo "${yellow}Downloading the Pixelcade Custom Slides script to Pixelcade System folder...${white}"
wget -O ${INSTALLPATH}pixelcade/system/pixelcade-custom-slides.sh https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/system/pixelcade-custom-slides.sh

# Download the Settings text file
echo "${yellow}Downloading the Pixelcade Custom Slides Settings text file to Pixelcade System folder...${white}"
wget -O ${INSTALLPATH}pixelcade/system/pixelcade-custom-slides-settings.txt https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/system/pixelcade-custom-slides-settings.txt

# Make sure it has execute permissions
sudo chmod +x ${INSTALLPATH}pixelcade/system/pixelcade-custom-slides.sh
echo "${yellow}Done adding Pixelcade Custom Slides to Pixelcade System folder...${white}"

# Add task to crontab
echo "${yellow}Adding schedule task to Crontab...${white}"

# Define the cron job to add
cron_job="@reboot ${INSTALLPATH}pixelcade/system/pixelcade-custom-slides.sh"

# Check if the cron job already exists in crontab
if ! crontab -l | grep -q "${cron_job}"; then
    # Add the cron job to crontab
    (crontab -l ; echo "$cron_job") | crontab -
    echo "${yellow}Cron job added.${white}"
else
    echo "${yellow}Cron job already exists.${white}"
fi

# Cleanup this file
echo "Cleaning Up..."
cd ${INSTALLPATH}
rm ${SCRIPTPATH}setup-pixelcade-custom-slides.sh

# Prompt the user to reboot pi
echo "${yellow}Reboot Raspberry Pi to start Pixelcade Custom Slides.${white}"
read -p "Reboot Now? (y/n): " yn

# Case statement to handle user input
case $yn in
    [Yy]* )
        reboot  # Execute the reboot command
        break   # Exit the loop after rebooting
        ;;
    [Nn]* )
        echo "Please reboot when you get a chance."  # Notify user to reboot later
        exit  # Exit the script
        ;;
    * )
        echo "Please answer yes or no."  # Prompt user for correct input
        ;;
esac
