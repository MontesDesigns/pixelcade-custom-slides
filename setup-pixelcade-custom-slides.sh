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
echo "${yellow}Checking for the Pixelcade Custom Slides folder...${white}"
if [[ ! -d "${INSTALLPATH}pixelcade-custom-slides" ]]; then #create the folder if it's not there
echo
echo "${green}Adding the Pixelcade Custom Slides folder...${white}"
   mkdir ${INSTALLPATH}pixelcade-custom-slides
fi

# Remove the old file if found
echo "${red}Remove old files if found...${white}"
cd ${INSTALLPATH}pixelcade-custom-slides && rm pixelcade-custom-slides.sh && rm pixelcade-custom-slides-settings.txt
echo

# Download the Pixelcade Custom Slides shell
echo "${green}Downloading the Pixelcade Custom Slides script to the Pixelcade Custom Slides folder...${white}"
wget -O ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides.sh https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/pixelcade-custom-slides/pixelcade-custom-slides.sh

# Make sure it has execute permissions
sudo chmod +x ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides.sh
echo

# Download the Settings text file
echo "${green}Downloading the Pixelcade Custom Slides Settings text file to the Pixelcade Custom Slides folder...${white}"
wget -O ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides-settings.txt https://raw.githubusercontent.com/MontesDesigns/pixelcade-custom-slides/main/pixelcade-custom-slides/pixelcade-custom-slides-settings.txt

# Make sure it has execute permissions
sudo chmod +x ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides-settings.txt
echo "${green}Done adding Pixelcade Custom Slides to the Pixelcade Custom Slides folder...${white}"
echo

# Add task to crontab
echo "${yellow}Adding the scheduled task to Crontab...${white}"
echo

# Define the cron job to add
cron_job="@reboot ${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides.sh"

# Check if the cron job already exists in crontab
if ! crontab -l | grep -q "${cron_job}"; then
    # Add the cron job to crontab
    (crontab -l ; echo "$cron_job") | crontab -
    echo "${green}Cron job added.${white}"
    echo
else
    echo "${yellow}Cron job already exists.${white}"
    echo
fi

# Cleanup this file
echo "${red}Cleaning Up...${white}"
cd ${INSTALLPATH}
rm ${SCRIPTPATH}setup-pixelcade-custom-slides.sh
echo

# Prompt the user to reboot pi
echo "${green}Reboot Raspberry Pi to start Pixelcade Custom Slides.${white}"
read -p "Reboot Now? (y/n): " yn

# Case statement to handle user input
case $yn in
    [Yy]* )
        sudo reboot  # Execute the reboot command
        ;;
    [Nn]* )
        echo "${blue}Please reboot when you get a chance.${white}"  # Notify user to reboot later
        echo
        echo "${magenta}Running Pixelcade Custom Slides${white}"  # Notify user that script is running
        cd ${INSTALLPATH}pixelcade-custom-slides
        sudo chmod +x pixelcade-custom-slides.sh && ./pixelcade-custom-slides.sh
        exit  # Exit the script
        ;;
    * )
        echo "${red}Please answer yes or no.${white}"  # Prompt user for correct input
        echo
        ;;
esac
