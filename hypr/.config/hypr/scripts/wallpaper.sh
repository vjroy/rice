#!/usr/bin/env bash
# Wallpaper manager using awww

WALLPAPER_DIR="$HOME/.local/share/wallpapers"
CACHE_FILE="$HOME/.cache/current_wallpaper"
TRANSITION_ARGS="--transition-type fade --transition-duration 1"

set_wallpaper() {
  local img="$1"
  awww img "$img" $TRANSITION_ARGS
  echo "$img" > "$CACHE_FILE"
}

pick_random() {
  local img
  img=$(find "$WALLPAPER_DIR" -maxdepth 2 \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
  set_wallpaper "$img"
}

pick_menu() {
  local img
  img=$(find "$WALLPAPER_DIR" -maxdepth 2 \( -name "*.jpg" -o -name "*.png" \) \
    | rofi -dmenu -p "Wallpaper" -i)
  [ -n "$img" ] && set_wallpaper "$img"
}

restore_last() {
  if [ -f "$CACHE_FILE" ] && [ -f "$(cat "$CACHE_FILE")" ]; then
    set_wallpaper "$(cat "$CACHE_FILE")"
  else
    set_wallpaper "$WALLPAPER_DIR/gruvbox-anime-wallhaven-2e2xyx.jpg"
  fi
}

case "$1" in
  --random)  pick_random ;;
  --pick)    pick_menu ;;
  --restore) restore_last ;;
  *)         restore_last ;;
esac
