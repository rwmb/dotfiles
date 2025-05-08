export LIBVA_DRIVER_NAME=nvidia
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export GTK_THEME=Nordic-darker-v40

export SYSTEMD_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim

[[ -z $WAYLAND_DISPLAY && $(tty) = /dev/tty1 ]] && exec Hyprland

