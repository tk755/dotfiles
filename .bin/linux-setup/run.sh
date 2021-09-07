#!/usr/bin/env bash

if [ -x "$(command -v apt)" ]; then
    echo "Installing packages using apt"
    source ./packages/apt-install.sh
    echo "Done"
else
    echo -e "\e[1m\e[31mAborting:\e[0m No suitable package manager detected."
    exit
fi

# TODO: automate
# echo "Setting up home directories"
# source ./setup-dirs/main.py
echo "Setup your home directory by running: ./setup-dirs/main.py"