#!/bin/bash

# Function to build patches
build_patches() {
    local branch="$1"
    local suffix="$2"

    # Switch to the correct branch
    cd poke-solus-fr-rse
    git switch "$branch"
    ./build.sh "$3"  # Pass an optional argument (e.g., "noshoes")
    cd ..

    # Create BPS patches
    for color in red green blue; do
        ./flips --create "pokemon${color}.gb" "poke-solus-fr-rse/pokesolus${color}.gbc" "patches/pokesolus-${suffix}-${color}.bps"
    done
}

# Clean previous patches
find patches -type f -name "*.bps" -delete

# Build patches for each configuration
build_patches "runningshoes" "rse"
build_patches "solus-fr" "fr-rse"
build_patches "solus-fr" "fr" "noshoes"

# Cleanup generated files
find poke-solus-fr-rse -type f \( -name "*.o" -o -name "*.gbc" -o -name "*.map" -o -name "*.sym" -o -name "*.pic" -o -name "*.1bpp" -o -name "*.2bpp" \) -delete
