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

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <path_to_script.sh> <cron_schedule>"
    echo "Example: $0 /home/user/myscript.sh '* * * * *'"
    exit 1
fi

# Assign arguments to variables
SCRIPT_PATH="${INSTALLPATH}pixelcade/system/autostart-pixelcade-custom-slides.sh"
CRON_SCHEDULE="$@reboot"

# Add the cron job to the crontab
(crontab -l ; echo "$CRON_SCHEDULE $SCRIPT_PATH >/dev/null 2>&1") | sort - | uniq - | crontab -

echo "Cron job added:"
echo "$CRON_SCHEDULE $SCRIPT_PATH"
echo "reboot pi to test Cron Job"
