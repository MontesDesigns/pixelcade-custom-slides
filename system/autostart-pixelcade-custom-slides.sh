#!/bin/bash

# Number of times to repeat the curl loop
num_repeats=3

# Delay between each iteration (in seconds)
delay_seconds=5

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

# Function to perform cURL request
perform_curl() {
    local url=$1
    for ((i=1; i<=$num_repeats; i++)); do
        echo "Fetching $url (Attempt $i)"
        curl -sS $url
        echo
        sleep $delay_seconds  # Add delay after each iteration
    done
}

# Variable to count total cURL requests
total_requests=$(( ${#urls[@]} * $num_repeats ))
current_requests=0

# Loop through each URL and perform cURL requests
for url in "${urls[@]}"; do
    perform_curl "$url"
    current_requests=$(( current_requests + num_repeats ))
    if [ $current_requests -ge $total_requests ]; then
        echo "All cURL requests completed."
        break
    fi
done

# Optionally, you can add additional cleanup or exit statements here if needed.
