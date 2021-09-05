#!/usr/bin/env python3

import os
import shutil
import xdg

CONFIG_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'config')

sym_dirs = {} # dir path : src dir path
xdg_dirs = {} # dir path : XDG dir name

# parse input and create non-linked directories
with open(CONFIG_DIR, 'r') as f:
    for line in f:
        if not (line.startswith('#') or len(line.strip()) == 0):
            # get xdg dir name
            try:
                xdg_dir = line[:line.index(':')].strip()
                line = line[line.index(':') + 1:].strip()
            except ValueError:
                xdg_dir = None

            # get dropbox path
            try:
                src_dir = line[line.index('=') + 1:].strip()
                src_dir = os.path.expanduser(src_dir)
                line = line[:line.index('=')].strip()
            except ValueError:
                src_dir = None

            # get path and remove existing link
            user_dir = os.path.expanduser(line.strip())
            if os.path.islink(user_dir):
                os.remove(user_dir)

            # add to dicts
            if xdg_dir is not None and xdg_dir in xdg.DIRS:
                xdg_dirs[user_dir] = xdg_dir

            if src_dir is not None:
                sym_dirs[user_dir] = src_dir

            # make non-linked directory
            elif not os.path.exists(user_dir):
                os.makedirs(user_dir)
                print(f'Created {user_dir}')

# create linked directories
for dst, src in sym_dirs.items():
    if not os.path.exists(dst):
        os.symlink(src, dst)
        print(f'Created link from {src} to {dst}')

# rename XDG directories
for new_dir, name in xdg_dirs.items():
    # move old directory
    old_dir = xdg.get_dir(name)
    if os.path.exists(old_dir) and old_dir != new_dir:
        # move contents of old directory
        for item in os.listdir(old_dir):
            shutil.move(os.path.join(old_dir, item), os.path.join(new_dir, item))

        # remove empty directory
        os.rmdir(old_dir)
        print(f'Moved contents of {old_dir} to {new_dir}')

# rewrite XDG config files
open(xdg.PATH, 'w').close()
with open(xdg.PATH, 'w') as f:
    for path, name in xdg_dirs.items():
        f.write(f'{name}="{path}"\n')
        print(f'Set {name} to {path}')

with open(xdg.CONF, 'w') as f:
    f.write('enabled=False')
