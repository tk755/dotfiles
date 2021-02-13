#!/usr/bin/env bash

# This program reconnects the the network module to the kernel.
# Useful for reconnecting to wifi.

modprobe -r brcmfmac
modprobe brcmfmac

nmcli