#!/usr/bin/env bash

echo 'Copying scripts into filesystem:'

cp -v setup/network-hibernation.sh /usr/lib/systemd/system-sleep/network-hibernation
cp -v setup/lid-wakeup-disable.sh /usr/lib/systemd/system-sleep/lid-wakeup-disable