#!/usr/bin/env python3

import subprocess

def olkb():
    """Returns whether an OLKB keyboard is connected to the computer.
    Requires: xinput, grep, wc."""
    proc1 = subprocess.Popen(['xinput', 'list'], stdout=subprocess.PIPE)
    proc2 = subprocess.Popen(['grep', 'OLKB'], stdin=proc1.stdout, stdout=subprocess.PIPE)
    proc3 = subprocess.Popen(['wc', '-l'], stdin=proc2.stdout, stdout=subprocess.PIPE)
    stdout, stderr = proc3.communicate()

    return not int(stdout) == 0

if __name__ == '__main__':
    if olkb():
        print('olkb connected')
    else:
        print('olkb not connected')
