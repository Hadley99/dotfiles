#!/bin/bash

DOTFILES="$HOME/dotfiles"

find "$DOTFILES" -maxdepth 2 -name 'links.prop' | while read -r linkfile; do
  while read -r line || [[ -n "$line" ]]; do

    src=$(eval echo "$line" | cut -d '=' -f 1)
    dst=$(eval echo "$line" | cut -d '=' -f 2)
    dir=$(dirname "$dst")

    if [[ -L "$dst" ]]; then
      echo "Skipping \"$dst\" - Already a symbolic link"
      continue
    fi

    echo "$src $dst"
    mkdir -p "$dir"
    ln -sf "$src" "$dst"
  done <"$linkfile"
done
