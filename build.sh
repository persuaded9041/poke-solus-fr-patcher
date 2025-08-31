#!/bin/bash

# Clean up generated files
find ./poke-solus-fr -type f -name "*.o" -delete
find ./poke-solus-fr -type f -name "*.gbc" -delete
find ./poke-solus-fr -type f -name "*.map" -delete
find ./poke-solus-fr -type f -name "*.sym" -delete
find ./poke-solus-fr -type f -name "*.pic" -delete
find ./poke-solus-fr -type f -name "*.1bpp" -delete
find ./poke-solus-fr -type f -name "*.2bpp" -delete

# Check the script for argument
if [ "$1" == "argvalue" ]; then
    echo "Running make with ARGVALUE=x"
    make -C poke-solus-fr ARGVALUE=0 RGBDS=../rgbds/
else
    echo "Running make with default settings"
    make -C poke-solus-fr RGBDS=../rgbds/
fi