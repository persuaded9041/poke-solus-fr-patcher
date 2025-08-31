#!/bin/bash

# Function to build patches
build_patches() {
    local branch="$1"
    local suffix="$2"
    local build_arg="$3"

    # Switch to the correct branch
    cd poke-solus-fr
    git switch "$branch"
    cd ..
    ./build.sh "$build_arg"  # Pass an optional argument (e.g., "noshoes")

    # Create BPS patches
    ./flips --create "Pokemon - Red Version (USA, Europe) (SGB Enhanced).gb" poke-solus-fr/pokesolusred.gbc patches/pokesolus-${suffix}-red.bps
    ./flips --create "Pokemon - Red Version (USA, Europe) (SGB Enhanced).gb" poke-solus-fr/pokesolusgreen.gbc patches/pokesolus-${suffix}-green.bps
    ./flips --create "Pokemon - Blue Version (USA, Europe) (SGB Enhanced).gb" poke-solus-fr/pokesolusblue.gbc patches/pokesolus-${suffix}-blue.bps
}

# Clean previous patches
find patches -type f -name "*.bps" -delete

# Build patches for each configuration
build_patches "master" "fr"

# Cleanup generated files
find poke-solus-fr -type f \( -name "*.o" -o -name "*.gbc" -o -name "*.map" -o -name "*.sym" -o -name "*.pic" -o -name "*.1bpp" -o -name "*.2bpp" \) -delete
