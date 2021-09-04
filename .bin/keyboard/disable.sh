#!/usr/bin/env bash

# use `xinput` to find id of keyboard
# TODO: automate id
xinput float 17 && echo "laptop keyboard disabled"
