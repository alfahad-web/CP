#!/bin/bash

# Function to check and install a package
install_if_missing() {
    dpkg -l | grep -q "$1" || sudo apt update && sudo apt install -y "$1"
}

echo "Checking and installing GCC and G++ if missing..."
install_if_missing gcc
install_if_missing g++

# Ensure standard library headers are installed
install_if_missing build-essential

# Path to bits/stdc++.h
BITS_HEADER="/usr/include/c++/$(g++ -dumpversion)/bits/stdc++.h"

if [[ -f "$BITS_HEADER" ]]; then
    echo "Precompiling bits/stdc++.h..."
    sudo g++ -std=c++17 -x c++-header "$BITS_HEADER" -o /usr/include/stdc++.h.gch
    echo "Precompilation complete. You can now use #include <bits/stdc++.h> in your C++ programs."
else
    echo "Error: bits/stdc++.h not found. Your GCC version may not include it."
fi
