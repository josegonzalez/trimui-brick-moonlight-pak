#!/bin/sh
echo "$0" "$@"
progdir="$(dirname "$0")"
cd "$progdir" || exit 1
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$progdir"
echo 1 >/tmp/stay_awake
trap "rm -f /tmp/stay_awake" EXIT INT TERM HUP QUIT

/usr/trimui/apps/moonlight/launch.sh
