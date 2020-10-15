# `distro-setup/` v.0.1
This directory contains scripts for automating the process of setting up and installing applications onto a fresh installation of Linux. Currently, the only supported distribution is Debian 10.

## Contributing to this Repository
Applications should be added to this repository consistently as they are installed and configured on a local machine.

TODO: add a note on how to do this once a better structure is developed

## `setup*.sh`

This is very much WIP.

The driver program `setup.sh` should begin an interactive CLI that prompts the user for various information, like Linux distribution, machine purpose (i.e. personal, work, server, etc.), etc. and selects a set of applications to install which the user can then override. 

The driver program should provide enough arguments so that the entire input can be automated and stored in a curried script.

Then we will have executable scripts like `setup-debian.sh` which automate the entire setting up of Debian for instance.
