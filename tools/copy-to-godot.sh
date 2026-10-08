#!/bin/sh
set -eu
SRC="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
for dest in \
  /storage/emulated/0/Documents/new-game-project \
  /sdcard/Documents/new-game-project \
  /mnt/shared/Documents/new-game-project
do
  if mkdir -p "$dest" 2>/dev/null; then
    cp -a "$SRC"/. "$dest"/
    echo "COPIED $dest"
    echo "Reopen this folder in Godot. Output must show:"
    echo "[MCP Bridge] Listening on http://127.0.0.1:9080"
    exit 0
  fi
done
echo "NO_SHARED_STORAGE"
echo "Godot folder was not writable from this shell."
exit 1
