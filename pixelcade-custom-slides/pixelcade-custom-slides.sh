#!/bin/bash

# Pause for Pixelcade to boot completely
sleep 5

# INSTALLPATH="/home/pi/"
INSTALLPATH=$HOME"/"

# File containing list of URLs
urls_file="${INSTALLPATH}pixelcade-custom-slides/pixelcade-custom-slides-settings.txt"

# Default values
default_repeat_count=1
default_delay_seconds=5

# Check if the file exists
if [ ! -f "$urls_file" ]; then
    echo "Error: $urls_file not found."
    exit 1
fi

# Initialize variables
repeat_count=$default_repeat_count
delay_seconds=$default_delay_seconds

# Process settings first
while IFS= read -r line; do
    # Trim leading and trailing spaces
    line=$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Skip lines starting with #
    if [[ "$line" =~ ^# ]]; then
        continue
    fi

    # Check for settings: repeat_count
    if [[ "$line" =~ ^repeat_count= ]]; then
        eval "$line"  # Evaluate the line to set the repeat_count variable
        continue  # Move to the next line
    fi

    # Check for settings: delay_seconds
    if [[ "$line" =~ ^delay_seconds= ]]; then
        eval "$line"  # Evaluate the line to set the delay_seconds variable
        continue  # Move to the next line
    fi

    # If it's not a setting line, it's assumed to be a URL
    urls+=("$line")
done < "$urls_file"

# Set default values if not overridden in url_file
repeat_count="${repeat_count:-$default_repeat_count}"
delay_seconds="${delay_seconds:-$default_delay_seconds}"

# Loop through the list of URLs
for ((i=0; i<repeat_count; i++)); do
    for url in "${urls[@]}"; do
        echo "Curling $url"
        curl_output=$(curl -sS "$url")  # Perform the curl request (adjust options as needed)
        echo "$curl_output"  # Display curl output
        echo "Wait $delay_seconds seconds"  # Display specified seconds before the next iteration
        sleep "$delay_seconds"  # Wait for specified seconds before the next iteration
        echo  # Print a newline for separation between outputs
    done
    echo "Finished displaying URLs list $((i + 1)) of $repeat_count times."
done
