#!/bin/sh
set -eo pipefail
PAK_DIR="$(dirname "$0")"
PAK_NAME="$(basename "$PAK_DIR")"
PAK_NAME="${PAK_NAME%.*}"
[ -f "$USERDATA_PATH/$PAK_NAME/debug" ] && set -x

cd "$PAK_DIR" || exit 1

rm -f "$LOGS_PATH/$PAK_NAME.txt"
exec >>"$LOGS_PATH/$PAK_NAME.txt"
exec 2>&1

echo "$0" "$@"

echo "1" >/tmp/stay_awake
trap "rm -f /tmp/stay_awake" EXIT INT TERM HUP QUIT
/usr/trimui/apps/moonlight/launch.sh
