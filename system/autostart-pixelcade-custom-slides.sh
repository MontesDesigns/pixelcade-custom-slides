#!/bin/bash

# Define your list of marquee URLs here
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
      # Add more URLs as needed
)

# Number of times to repeat the whole list
repeat_count=3

# Loop through the list of URLs
for ((i=0; i<repeat_count; i++)); do
  for url in "${urls[@]}"; do
    echo "Curling $url"
    curl -sS "$url"  # Perform the curl request (adjust options as needed)
    sleep 5  # Wait for 5 seconds before the next iteration
  done
done

echo "All marquee images have been sent to Pixelcade."
