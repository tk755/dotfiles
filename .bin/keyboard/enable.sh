#!/usr/bin/env bash

# use `xinput` to find id of keyboard
# TODO: automate id
xinput reattach 12 3 && echo "laptop keyboard enabled"
