#!/bin/bash

CONFIG_DIR="./config"
HOME_DIR="./home"

shopt -s dotglob nullglob

# Dry run mode
dry_run=false
if [[ "$1" == "--dry-run" ]]; then
  dry_run=true
  echo "🧪 Dry-run mode enabled — no changes will be made."
fi

read -p "Install all files without asking? [y/N]: " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  install_all=true
else
  install_all=false
fi

# backup files in order to link them
backup_and_link() {
  local src="$1"
  local dst="$2"
  local abs_src
  abs_src=$(realpath "$src")

  # Already linked correctly
  if [[ -L "$dst" ]] && [[ "$(realpath "$dst")" == "$abs_src" ]]; then
    echo "✔️  Skipping $dst — already linked correctly."
    return
  fi

  # Remove broken symlink
  if [[ -L "$dst" && ! -e "$dst" ]]; then
    echo "🧹 Removing broken symlink: $dst"
    $dry_run || rm "$dst"
  fi

  # Ask before linking if not in install_all
  if [[ "$install_all" == false ]]; then
    echo "Target: $dst"
    echo "Will link: $abs_src"
    if [[ -e "$dst" && ! -L "$dst" ]]; then
      echo "⚠️  $dst exists and is not a symlink."
    fi
    read -p "Link this file? [y/N]: " answer
    [[ "$answer" =~ ^[Yy]$ ]] || return
  fi

  # Backup non-symlinks
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    backup="${dst}.bak"
    echo "🗂️  Backing up existing file to $backup"
    $dry_run || mv -f "$dst" "$backup"
  fi

  echo "🔗 Creating symlink: $dst -> $abs_src"
  $dry_run || ln -sf "$abs_src" "$dst"
}

# Link configs to ~/.config/
for dir in "$CONFIG_DIR"/*/; do
  name=$(basename "$dir")
  dst="$HOME/.config/$name"
  backup_and_link "$dir" "$dst"
done

# Link home files/folders to ~/
for item in "$HOME_DIR"/*; do
  name=$(basename "$item")
  dst="$HOME/$name"
  backup_and_link "$item" "$dst"
done

shopt -u dotglob nullglob

