#!/bin/sh

FILENAME=./_build/rpi0/dev/nerves/images/zero.fw
FILESIZE=$(stat -c%s "$FILENAME")
printf "fwup:$FILESIZE,reboot\n" | cat - $FILENAME | ssh -s -p 8989 nerves.local nerves_firmware_ssh

