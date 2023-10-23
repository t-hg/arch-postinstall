#!/usr/bin/env bash

echo "START"
set -xe

## i3
#sudo pacman -S --noconfirm gvfs
#sudo pacman -S --noconfirm xdg-user-dirs
#sudo pacman -S --noconfirm xdg-user-dirs-gtk
#xdg-user-dirs-gtk-update
#xdg-user-dirs-update
#sudo pacman -S --noconfirm xorg
#sudo pacman -S --noconfirm xorg-xinit
#sudo pacman -S --noconfirm xf86-video-amdgpu
#sudo pacman -S --noconfirm mesa
#sudo pacman -S --noconfirm i3-wm
#sudo pacman -S --noconfirm dex
#sudo pacman -S --noconfirm dmenu
#sudo pacman -S --noconfirm j4-dmenu-desktop
#sudo pacman -S --noconfirm network-manager-applet
#sudo pacman -S --noconfirm brightnessctl
#sudo pacman -S --noconfirm pamixer
#sudo pacman -S --noconfirm pavucontrol
#sudo pacman -S --noconfirm xss-lock
#sudo pacman -S --noconfirm xclip
#git clone https://github.com/t-hg/i3-config $HOME/Projects/i3
#sudo pacman -S --noconfirm meson
#sudo pacman -S --noconfirm ninja
#pushd $HOME/.config/i3
#rm -rf i3
#./install_patches.sh
#popd
#git clone https://github.com/t-hg/i3-status $HOME/Projects/i3-status
#pushd $HOME/Projects/i3-status
#make
#sudo make install
#popd
#git clone https://github.com/t-hg/i3-rename-workspace $HOME/Projects/i3-rename-workspace
#pushd $HOME/Projects/i3-rename-workspace
#go build
#sudo mv i3-rename-workspace /usr/local/bin
#popd
#git clone https://github.com/t-hg/i3-alt-tab $HOME/Projects/i3-alt-tab
#pushd $HOME/Projects/i3-alt-tab
#go build
#sudo mv i3-alt-tab /usr/local/bin
#popd
#sudo pacman -S --noconfirm nitrogen
#git clone https://github.com/t-hg/x11-on-resolution-change $HOME/Projects/x11-on-resolution-change
#pushd $HOME/Projects/x11-on-resolution-change
#make build
#sudo make install
#popd
#git clone https://github.com/t-hg/x11-systray-volume $HOME/Projects/x11-systray-volume
#pushd $HOME/Projects/x11-systray-volume
#make build
#sudo make install
#popd
#git clone https://github.com/t-hg/x11-systray-brightness $HOME/Projects/x11-systray-brightness
#pushd $HOME/Projects/x11-systray-brightness
#make build
#sudo make install
#popd
#cat > $HOME/.xinitrc <<'EOF'
##!/bin/sh
#
#userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap
#
## merge in defaults and keymaps
#
#if [ -f $sysresources ]; then
#  xrdb -merge $sysresources
#fi
#
#if [ -f $sysmodmap ]; then
#  xmodmap $sysmodmap
#fi
#
#if [ -f "$userresources" ]; then
#  xrdb -merge "$userresources"
#fi
#
#if [ -f "$usermodmap" ]; then
#  xmodmap "$usermodmap"
#fi
#
## start some nice programs
#
#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#  [ -x "$f" ] && . "$f"
# done
# unset f
#fi
#
#xss-lock --transfer-sleep-lock -- slock &
#x11-on-resolution-change "nitrogen --restore" &
#x11-systray-volume &
#x11-systray-brightness &
#nm-applet &
#blueman-applet &
#exec i3
#EOF


## Font
#sudo pacman -S --noconfirm ttf-dejavu
#sudo pacman -S --noconfirm ttf-iosevka-nerd
#mkdir $HOME/.config/fontconfig
#cat > $HOME/.config/fontconfig/fonts.conf <<'EOF'
#<?xml version="1.0"?>
#<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
#<fontconfig>
#  <!-- Fallback fonts preference order -->
#  <alias>
#    <family>sans-serif</family>
#    <prefer>
#      <family>DejaVu Sans</family>
#    </prefer>
#  </alias>
#  <alias>
#    <family>serif</family>
#    <prefer>
#      <family>DejaVu Serif</family>
#    </prefer>
#  </alias>
#  <alias>
#    <family>monospace</family>
#    <prefer>
#      <family>Iosevka Nerd Font</family>
#      <family>DejaVu Sans Mono</family>
#    </prefer>
#  </alias>
#</fontconfig>
#EOF

## Theme
#yay -S --noconfirm dracula-gtk-theme
#yay -S --noconfirm dracula-cursors-git
#yay -S --noconfirm beautyline
#cat >> $HOME/.Xresources <<'EOF'
#Xcursor.theme: Dracula-cursors
#EOF
#cat > $HOME/.gtkrc-2.0 <<'EOF'
#gtk-cursor-theme-name = "Dracula-cursors"
#gtk-icon-theme-name = "BeautyLine"
#gtk-theme-name = "Dracula"
#gtk-font-name = "DejaVu Sans 11"
#EOF
#mkdir -p $HOME/.config/gtk-3.0
#cat > $HOME/.config/gtk-3.0/settings.ini <<'EOF'
#[Settings]
#gtk-cursor-theme-name = Dracula-cursors
#gtk-icon-theme-name = BeautyLine
#gtk-theme-name = Dracula
#gtk-font-name = DejaVu Sans 11
#EOF

## Terminal emulator
#sudo pacman -S --noconfirm alacritty
#git clone https://github.com/t-hg/alacritty-config $HOME/.config/alacritty
## Screenlocker
#pushd $HOME/Projects
#git clone https://github.com/t-hg/slock-config
#pushd slock-config
#./apply-patches.sh
#popd
#popd

## Wallpapers
#mkdir -p $HOME/Pictures/Wallpapers/
#git clone --depth 1 https://gitlab.com/dwt1/wallpapers.git $HOME/Pictures/Wallpapers/dt

## Touchpad
#cat <<'EOF' | sudo tee /etc/X11/xorg.conf.d/40-touchpad.conf
#Section "InputClass"
#  Identifier "libinput touchpad catchall"
#  MatchIsTouchpad "on"
#  MatchDevicePath "/dev/input/event*"
#  Driver "libinput"
#  Option "Tapping" "on"
#  Option "NaturalScrolling" "on"
#EndSection
#EOF

## Bluetooth
#sudo pacman -S --noconfirm bluez
#sudo pacman -S --noconfirm blueman
#sudo systemctl enable bluetooth.service
#sudo systemctl start bluetooth.service

## Image viewer
#sudo pacman -S --noconfirm sxiv
#cat >> $HOME/.Xresources <<'EOF'
#Sxiv.background: #282c34
#EOF

## DisplayLink
#sudo pacman -S --noconfirm autorandr
#yay -S --noconfirm evdi-compat-git
#yay -S --noconfirm displaylink
#sudo systemctl enable displaylink.service
#cat <<'EOF' | sudo tee /etc/X11/xorg.conf.d/20-evdi.conf
#Section "OutputClass"
#	Identifier "DisplayLink"
#	MatchDriver "evdi"
#	Driver "modesetting"
#	Option "AccelMethod" "none"
#EndSection
#EOF

## More applications
#sudo pacman -S --noconfirm pcmanfm-gtk3
#sudo pacman -S --noconfirm alsa-utils
#sudo pacman -S --noconfirm arandr

set +x
echo "DONE"
