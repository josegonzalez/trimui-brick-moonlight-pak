#!/bin/sh
PAK_DIR="$(dirname "$0")"
PAK_NAME="$(basename "$PAK_DIR")"
PAK_NAME="${PAK_NAME%.*}"
set -x

rm -f "$LOGS_PATH/$PAK_NAME.txt"
exec >>"$LOGS_PATH/$PAK_NAME.txt"
exec 2>&1

echo "$0" "$@"
cd "$PAK_DIR" || exit 1
mkdir -p "$USERDATA_PATH/$PAK_NAME"

cleanup() {
    rm -f /tmp/stay_awake
}

main() {
    echo "1" >/tmp/stay_awake
    trap "cleanup" EXIT INT TERM HUP QUIT

    if [ -f /usr/trimui/apps/moonlight/launch.sh ]; then
         chmod +x /usr/trimui/apps/moonlight/launch.sh
         /usr/trimui/apps/moonlight/launch.sh
    fi
}

main "$@"
