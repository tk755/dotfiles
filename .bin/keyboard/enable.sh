#!/usr/bin/env bash

# use `xinput` to find id of keyboard
xinput reattach 17 3 && echo "laptop keyboard enabled"
