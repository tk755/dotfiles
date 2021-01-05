#!/usr/bin/env python3

import os
import sys

PATH = os.path.expanduser('~/.config/user-dirs.dirs')
CONF = os.path.expanduser('~/.config/user-dirs.conf')
DIRS = ['XDG_DESKTOP_DIR', 'XDG_DOCUMENTS_DIR', 'XDG_DOWNLOAD_DIR', \
        'XDG_MUSIC_DIR', 'XDG_PICTURES_DIR', 'XDG_PUBLICSHARE_DIR', \
        'XDG_TEMPLATES_DIR', 'XDG_VIDEOS_DIR']

def get_dir(xdg_name):
    """Returns the path to the directory specified by the XDG name,
    and None if it doesn't exist."""

    if xdg_name not in DIRS:
        return None

    with open(PATH, 'r') as f:
        for line in f:
            if line.startswith('#'):
                continue

            name = line[:line.index('=')]
            
            if name == xdg_name:
                path = line[line.index('=')+1:]
                path = path.strip('"\n').replace('$HOME', '~')
                path = os.path.expanduser(path)

                return path

if __name__ == '__main__':
    xdg_name = sys.argv[1]
    xdg_path = get_dir(xdg_name)
    print(xdg_path)