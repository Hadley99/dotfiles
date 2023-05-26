#!/bin/bash

# Define the dotfiles directory
DOTFILES="$HOME/dotfiles"

install_sym_links() {
  find "$DOTFILES" -maxdepth 2 -name 'links.prop' -not -path '*.git*' | while read -r linkfile; do
    while read -r line || [[ -n "$line" ]]; do

      src=$(eval echo "$line" | cut -d '=' -f 1)
      dst=$(eval echo "$line" | cut -d '=' -f 2)
      dir=$(dirname "$dst")

      # if [ -d "$dst" ]; then
      #   echo "directory \"$dst\" exists"
      # fi

      mkdir -p "$dir"
      ln -sf "$src" "$dst"
    done <"$linkfile"
  done
}

install_sym_links
