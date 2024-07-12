# pixelcade-custom-slides
Adds a custom slides feature to Pixelcade LED running via Raspberry Pi. This also adds an auto-start feature to the bootup of the Raspberry Pi.

Before installing you will need to edit the system/autostart-pixelcade-custom-slides.sh file to the marquee you would like.

# URLs to be cURL'ed in the loop
urls=(
    "http://pixelcade.local:8080/arcade/stream/user/jodys-arcade-128x32.gif"
    "http://pixelcade.local:8080/arcade/stream/mame/centiped"
    "http://pixelcade.local:8080/arcade/stream/mame/milliped"
    "http://pixelcade.local:8080/arcade/stream/mame/tetris"
    "http://pixelcade.local:8080/arcade/stream/mame/frogger"
    "http://pixelcade.local:8080/arcade/stream/user/pipplo-128x32.png"
    "http://pixelcade.local:8080/arcade/stream/images/suprmrio"
    "http://pixelcade.local:8080/arcade/stream/images/dkngjnrj"
    "http://pixelcade.local:8080/arcade/stream/mame/galaga"
    "http://pixelcade.local:8080/arcade/stream/mame/1941"
    "http://pixelcade.local:8080/arcade/stream/user/montes-128x32.png"
)
