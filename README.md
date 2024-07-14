# pixelcade-custom-slides
Adds a custom slides feature to Pixelcade LED running via Raspberry Pi. 
This also adds a crontab task on the Raspberry Pi to start the slides upon bootup.

# pixelcade-custom-slides-settings.txt
After installation, you will need to edit the file called "pixelcade-custom-slides-settings.txt" located within the directory "pixelcade-custom-slides"
This file contains the URLs for each marquee you want in the slide show, the settings for how many times to repeat the list, and the delay time between each marquee changes.

# setup-pixelcade-custom-slides
Run the following from the command line to install this feature
curl -kLO -H "Cache-Control: no-cache" https://github.com/MontesDesigns/pixelcade-custom-slides/raw/main/setup-pixelcade-custom-slides.sh && chmod +x setup-pixelcade-custom-slides.sh && ./setup-pixelcade-custom-slides.sh
