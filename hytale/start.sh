#!/bin/bash
if [ ! -f HytaleServer.jar ]; then
  echo "Server files not found, downloading downloader..."
  curl -o hytale-downloader.zip https://downloader.hytale.com/hytale-downloader.zip
  unzip hytale-downloader.zip
  rm hytale-downloader.zip
  echo "Running downloader..."
  ./hytale-downloader-linux-amd64
  if [ $? -eq 0 ] && [ -d output ]; then
    cp output/server/HytaleServer.jar .
    cp output/assets/Assets.zip .
    echo "Download complete, starting server..."
  else
    echo "Download failed or timed out. Please authenticate and try again."
    exit 1
  fi
fi
java -jar HytaleServer.jar --assets Assets.zip