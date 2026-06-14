#!/usr/bin/env bash
# Launch startup layout: nvim (left) + Chrome (right) on workspace 1
# Only runs once — delete ~/.cache/hypr-startup-done to reset

FLAG="$HOME/.cache/hypr-startup-done"
[ -f "$FLAG" ] && exit 0

touch "$FLAG"

hyprctl dispatch workspace 1

kitty --title "nvim" nvim &
sleep 0.8

google-chrome-stable &
