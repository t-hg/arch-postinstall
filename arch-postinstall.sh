#!/usr/bin/env bash

echo "START"
set -xe

## No beep
#sudo rmmod pcspkr
#cat <<'EOF' | sudo tee /etc/modprobe.d/nobeep.conf
#blacklist pcspkr
#EOF

## Keyboard layout
#sudo localectl set-locale en_GB.UTF-8
#sudo localectl set-keymap sg
#sudo localectl status

## Ensure folders
#mkdir -p $HOME/.config
#mkdir -p $HOME/.ssh
#mkdir -p $HOME/Projects
#sudo pacman -S --noconfirm xdg-user-dirs
#sudo pacman -S --noconfirm xdg-user-dirs-gtk
#xdg-user-dirs-gtk-update
#xdg-user-dirs-update
#rm -rf Templates
#rm -rf Public

## C development
#sudo pacman -S --noconfirm base-devel
#sudo pacman -S --noconfirm clang
#sudo pacman -S --noconfirm ccls

## Go development
#sudo pacman -S --noconfirm go
#sudo pacman -S --noconfirm gopls
#sudo pacman -S --noconfirm delve
#cat >> .bashrc <<'EOF'
## Go
#export GOPATH=$HOME/.go
#export PATH=$GOPATH:$PATH
#EOF

## Lua development
#sudo pacman -S --noconfirm lua-language-server

## Wget
#sudo pacman -S --noconfirm wget

## Git
#sudo pacman -S --noconfirm git
#read -r -p "git config global user.name: " user && git config --global user.name "$user"
#read -r -p "git config global user.email: " email && git config --global user.email "$email"

## Bash
#sudo pacman -S --noconfirm bash-completion
#sudo pacman -S --noconfirm bash-preexec
#sudo pacman -S --noconfirm bash-language-server
#sudo pacman -S --noconfirm shellcheck
#git clone https://github.com/t-hg/bash-config $HOME/.config/bash
#cat > $HOME/.bashrc <<'EOF'
#. $HOME/.config/bash/bashrc
#EOF

## Editor
#DO_INSTALL neovim
#sudo ln -s /usr/bin/nvim /usr/bin/vi
#sudo ln -s /usr/bin/nvim /usr/bin/vim
#git clone https://github.com/t-hg/nvim-config $HOME/.config/nvim
#sudo mkdir -p /root/.config/nvim
#sudo cp $HOME/.config/nvim/lua/options.lua /root/.config/nvim/init.lua

## SSH
#touch $HOME/.ssh/config
#touch $HOME/.ssh/id_rsa
#touch $HOME/.ssh/id_rsa.pub
#chmod 600 $HOME/.ssh/id_rsa
#cat > $HOME/.ssh/config <<'EOF'
#Host *
#  AddKeysToAgent 1h
#EOF
#sudo pacman -S --noconfirm keychain
#cat >> $HOME/.bashrc <<'EOF'
#eval "$(keychain --eval --noask --quiet --agents ssh $HOME/.ssh/id_rsa)"
#EOF

## AUR helper
#pushd $HOME/Downloads
#wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
#tar xvf yay.tar.gz
#pushd yay
#makepkg
#sudo pacman -U yay*.zst
#popd
#popd

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

## i3
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
#nm-applet &
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

## More applications
#sudo pacman -S --noconfirm man-db
#sudo pacman -S --noconfirm man-pages
#sudo pacman -S --noconfirm firefox
#sudo pacman -S --noconfirm bitwarden
#sudo pacman -S --noconfirm pcmanfm-gtk3
#sudo pacman -S --noconfirm ripgrep-all
#sudo pacman -S --noconfirm tree

set +x
echo "DONE"

