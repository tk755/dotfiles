#!/usr/bin/env python3

import os
import subprocess
import detect

dir_name = (os.path.dirname(os.path.abspath(__file__)))
disable = os.path.join(dir_name, 'disable.sh')
enable = os.path.join(dir_name, 'enable.sh')

def main():
    """Disable laptop keyboard if OLKB keyboard is detected,
    otherwise enable it."""
    if detect.olkb():
        subprocess.run([disable], shell=True)
    else:
        subprocess.run([enable], shell=True)

if __name__ == '__main__':
    main()
