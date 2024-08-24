#!/bin/bash

# Create the output directory if it doesn't exist
mkdir -p compressed

# Loop through all video files in the "original" folder
for input in static/original/*.mp4; do
    # Get the filename without the path and extension
    filename=$(basename "${input%.*}")
    
    # Perform the two-pass encoding
    ffmpeg -i "$input" \
           -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 1 -an \
           -deadline best -row-mt 1 \
           -f null /dev/null && \
    ffmpeg -i "$input" \
           -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 2 \
           -deadline best -row-mt 1 \
           -c:a libopus -b:a 96k -ac 2 \
           "static/compressed/${filename}.webm"
    
    echo "Compressed $input to compressed/${filename}.webm"
done

# Clean up the two-pass log files
rm ffmpeg2pass-0.log