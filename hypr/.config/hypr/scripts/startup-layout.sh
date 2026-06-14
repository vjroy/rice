#!/usr/bin/env bash
# Launch startup layout: nvim (left) + Chrome (right) on workspace 1

hyprctl dispatch workspace 1

kitty --title "nvim" nvim &
sleep 0.8

google-chrome-stable &
