#!/bin/bash
# Number of times to repeat the curl loop
num_repeats=3

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

# Function to perform the curl requests
perform_curl() {
    for url in "${urls[@]}"
    do
        echo "Fetching $url ..."
        # Attempt to curl the URL with a timeout of 5 seconds
        curl --max-time 5 "$url"
        
        # Check curl exit code
        if [ $? -eq 0 ]; then
            echo "Successfully fetched $url"
        else
            echo "Failed to fetch $url"
            # Optionally, add retry logic or handle errors here
        fi
        
        sleep 5  # Pause for 5 seconds before the next request
    done
}

# Loop to repeat the curl requests either num_repeats times or until interrupted
echo "Press [Ctrl+C] to stop..."
for ((i=1; i<=num_repeats; i++))
do
    echo "=== Repeat $i ==="
    perform_curl
done

echo "Curl loop completed."