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
echo "${yellow}Check for Pixelcade Custom Slides folder...${white}"
if [[ ! -d "${INSTALLPATH}pixelcade-custom-slides" ]]; then #create the folder if it's not there
echo "${yellow}Adding Pixelcade Custom Slides folder...${white}"
   mkdir ${INSTALLPATH}pixelcade-custom-slides
fi

# Remove the old file if found
echo "${yellow}Remove old file if found...${white}"
cd ${INSTALLPATH}pixelcade-custom-slides && rm pixelcade-custom-slides.sh && rm pixelcade-custom-slides-settings.txt

# Download the Pixelcade Custom Slides shell
echo "${yellow}Downloading the Pixelcade Custom Slides script to Pixelcade Custom Slides folder...${white}"
wget -O ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides.sh https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/pixelcade-custom-slides/pixelcade-custom-slides.sh

# Make sure it has execute permissions
sudo chmod +x ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides.sh

# Download the Settings text file
echo "${yellow}Downloading the Pixelcade Custom Slides Settings text file to Pixelcade Custom Slides folder...${white}"
wget -O ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides-settings.txt https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/pixelcade-custom-slides/pixelcade-custom-slides-settings.txt

# Make sure it has execute permissions
sudo chmod +x ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides-settings.txt
echo "${yellow}Done adding Pixelcade Custom Slides to Pixelcade Custom Slides folder...${white}"

# Add task to crontab
echo "${yellow}Adding schedule task to Crontab...${white}"

# Define the cron job to add
cron_job="@reboot ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides.sh"

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
        sudo reboot  # Execute the reboot command
        ;;
    [Nn]* )
        echo "Please reboot when you get a chance."  # Notify user to reboot later
        echo "Running Pixelcade Custom Slides"  # Notify user that script is running
        cd ${INSTALLPATH}pixelcade-custom-slides pixelcade-custom-slides.sh && ./pixelcade-custom-slides.sh
        exit  # Exit the script
        ;;
    * )
        echo "Please answer yes or no."  # Prompt user for correct input
        ;;
esac
