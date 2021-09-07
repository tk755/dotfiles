#!/usr/bin/env bash

# Verify that script is being executed by root
if [ $USER != 'root' ]; then
    echo -e You must be "\e[1m\e[31mroot\e[0m" to run this script
    exit
fi

echo 'Copying scripts into filesystem:'
cp -v scripts/network-hibernation.sh /usr/lib/systemd/system-sleep/network-hibernation
cp -v scripts/lid-wakeup-disable.sh /usr/lib/systemd/system-sleep/lid-wakeup-disable