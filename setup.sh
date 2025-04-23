#!/bin/bash

CONFIG_DIR="./config"
HOME_DIR="./home"

shopt -s dotglob nullglob

read -p "Install all files without asking? [y/N]: " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  install_all=true
else
  install_all=false
fi

# Link configs to ~/.config/
for dir in "$CONFIG_DIR"/*/; do
  name=$(basename "$dir")
  
  if [[ "$install_all" == true ]]; then 
    echo "creating symlink from $(realpath "$dir") to $HOME/.config/$name"
    ln -sf "$(realpath "$dir")" "$HOME/.config/$name"
  fi
done

# Link home files/folders to ~/
for item in "$HOME_DIR"/*; do
  name=$(basename "$item")

  if [[ "$install_all" == true ]]; then 
    echo "creating symlink from $(realpath "$item") to $HOME/$name"
    ln -sf "$(realpath "$item")" "$HOME/$name"
  fi
done

shopt -u dotglob nullglob
