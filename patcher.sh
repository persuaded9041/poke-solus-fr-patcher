#!/bin/bash

# Function to build patches
build_patches() {
    local branch="$1"
    local suffix="$2"
    local build_arg="$3"

    # Switch to the correct branch
    cd poke-solus-fr-rse
    git switch "$branch"
    ./build.sh "$build_arg"  # Pass an optional argument (e.g., "noshoes")
    cd ..

    # Create BPS patches
    ./flips --create pokemonred.gb poke-solus-fr-rse/pokesolusred.gbc patches/pokesolus-${suffix}-red.bps
    ./flips --create pokemonred.gb poke-solus-fr-rse/pokesolusgreen.gbc patches/pokesolus-${suffix}-green.bps
    ./flips --create pokemonblue.gb poke-solus-fr-rse/pokesolusblue.gbc patches/pokesolus-${suffix}-blue.bps
}

# Clean previous patches
find patches -type f -name "*.bps" -delete

# Build patches for each configuration
build_patches "runningshoes" "rse"
build_patches "solus-fr" "fr-rse"
build_patches "solus-fr" "fr" "noshoes"

# Cleanup generated files
find poke-solus-fr-rse -type f \( -name "*.o" -o -name "*.gbc" -o -name "*.map" -o -name "*.sym" -o -name "*.pic" -o -name "*.1bpp" -o -name "*.2bpp" \) -delete
