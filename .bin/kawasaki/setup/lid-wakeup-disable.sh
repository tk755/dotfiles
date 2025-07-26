#!/usr/bin/env bash
# source: https://wiki.debian.org/InstallingDebianOn/Apple/MacBookPro/Early-2015-13-inch

# /usr/lib/systemd/system-sleep/lid-wakeup-disable
#
# Avoids that system wakes up immediately after suspend or hibernate with lid open
#
# Tested on MacBookPro12,1

case $1 in
  pre)
    if cat /proc/acpi/wakeup | grep -qE '^LID0.*enabled'; then
        echo LID0 > /proc/acpi/wakeup
    fi
    ;;
esac