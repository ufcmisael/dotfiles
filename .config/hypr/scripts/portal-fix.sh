#!/bin/bash
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-1}
sleep 1
/usr/lib/xdg-desktop-portal-hyprland &
sleep 1
/usr/lib/xdg-desktop-portal &

