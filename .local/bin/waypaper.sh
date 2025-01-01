#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert &>/dev/null; then
  echo "Error: ImageMagick is not installed. Please install it first."
  exit 1
fi

# Check if an argument was provided
if [ $# -eq 0 ]; then
  echo "Error: Please provide a wallpaper file as an argument"
  echo "Usage: $0 wallpaper_file"
  exit 1
fi

wallpaper="$1"

# Check if the input file exists
if [ ! -f "$wallpaper" ]; then
  echo "Error: File '$wallpaper' does not exist"
  exit 1
fi

# Create cache directory if it doesn't exist
cache_dir="$HOME/.cache"
mkdir -p "$cache_dir"

# Convert and resize to PNG (1920x1080)
if magick "$wallpaper" -resize 1920x1080^ -gravity center -extent 1920x1080 "$cache_dir/wallpaper.png"; then
  echo "Successfully created 1920x1080 PNG version at $cache_dir/wallpaper.png"
else
  echo "Error: Failed to create PNG version"
  exit 1
fi

# Convert and resize to JPG (1920x1080)
if magick "$wallpaper" -resize 1920x1080^ -gravity center -extent 1920x1080 "$cache_dir/wallpaper.jpg"; then
  echo "Successfully created 1920x1080 JPG version at $cache_dir/wallpaper.jpg"
else
  echo "Error: Failed to create JPG version"
  exit 1
fi
