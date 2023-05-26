#!/bin/bash

DOTFILES="$HOME/dotfiles"

find_with_ignored_folders() {
  ignored_folders=(".vscode" ".git")
  find_command="find $DOTFILES -maxdepth 2 -name 'links.prop' "
  for folder in "${ignored_folders[@]}"; do
    find_command+=" -not -path '*$folder*'"
  done

  eval "$find_command"
}

install_sym_links() {
  find_with_ignored_folders | while read -r linkfile; do
    while read -r line || [[ -n "$line" ]]; do

      src=$(eval echo "$line" | cut -d '=' -f 1)
      dst=$(eval echo "$line" | cut -d '=' -f 2)
      dir=$(dirname "$dst")

      # if [ -d "$dst" ]; then
      #   echo "directory \"$dst\" exists"
      # fi
      # echo "$src $dst"

      mkdir -p "$dir"
      ln -sf "$src" "$dst"
    done <"$linkfile"
  done
}

install_sym_links
