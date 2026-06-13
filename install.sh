#!/usr/bin/env bash
set -e

RICE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

components=(hypr waybar kitty rofi dunst gtk qt bash starship hyprlock)

for c in "${components[@]}"; do
  if [ -d "$RICE_DIR/$c" ]; then
    echo "Stowing $c..."
    stow --restow --target="$HOME" -d "$RICE_DIR" "$c"
  fi
done

echo "Done."
