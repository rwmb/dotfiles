export WLR_NO_HARDWARE_CURSORS=1
export LIBVA_DRIVER_NAME=nvidia
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_RENDERER=vulkan
export EDITOR=nvim
export VISUAL=nvim
export SYSTEMD_EDITOR=nvim

[[ -z $WAYLAND_DISPLAY && $(tty) = /dev/tty1 ]] && exec Hyprland

