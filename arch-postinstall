#!/usr/bin/env bash

set -e

. "./utils/log.sh"
. "./utils/pacman.sh"
. "./utils/append.sh"
. "./utils/git.sh"

install fzf

info "Select modules:\n"
modules=$(find ./modules -name "*.sh" | fzf --multi --height 20 --layout=reverse)
info "Selected modules:\n"
for module in $modules; do
  info "  $module\n"
done

for module in $modules; do
  . "$module"
done

## Editor
#sudo pacman -Rcns --noconfirm vim
#sudo pacman -Rcns --noconfirm nano
#sudo pacman -S --noconfirm neovim
#sudo rm -f /usr/bin/vi
#sudo rm -f /usr/bin/vim
#sudo ln -s /usr/bin/nvim /usr/bin/vi
#sudo ln -s /usr/bin/nvim /usr/bin/vim
#git clone https://github.com/t-hg/nvim-config $HOME/.config/nvim
#sudo mkdir -p /root/.config/nvim
#sudo cp $HOME/.config/nvim/lua/options.lua /root/.config/nvim/init.lua
#cat <<'EOF' | sudo tee -a /etc/profile
#export EDITOR=nvim
#export VISUAL=nvim
#
#EOF
#
## VPN
#sudo pacman -S --noconfirm wireguard-tools
#sudo pacman -S --noconfirm openresolv
#
#
## Go development
#sudo pacman -S --noconfirm go
#sudo pacman -S --noconfirm gopls
#sudo pacman -S --noconfirm delve
#cat >> $HOME/.bashrc <<'EOF'
## Go
#export GOPATH=$HOME/.go
#export PATH=$GOPATH/bin:$PATH
#EOF
#
## Lua development
#sudo pacman -S --noconfirm lua-language-server
#
## Web developement
#sudo pacman -S --noconfirm wget
#sudo pacman -S --noconfirm curl
#sudo pacman -S --noconfirm vscode-css-languageserver
#sudo pacman -S --noconfirm typescript-language-server
