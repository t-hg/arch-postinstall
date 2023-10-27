#!/usr/bin/env bash

echo "START"
set -xe

# No beep
sudo rmmod pcspkr
cat <<'EOF' | sudo tee /etc/modprobe.d/nobeep.conf
blacklist pcspkr
EOF

# Mirrors
sudo pacman -S --noconfirm rsync
sudo pacman -S --noconfirm reflector
sudo reflector --sort rate --country Switzerland --save /etc/pacman.d/mirrorlist

# VPN
sudo pacman -S --noconfirm wireguard-tools
sudo pacman -S --noconfirm openresolv

# Keyboard layout
sudo localectl set-locale en_GB.UTF-8
sudo localectl set-keymap sg
sudo localectl status

# Ensure folders
mkdir -p $HOME/.config
mkdir -p $HOME/.ssh
mkdir -p $HOME/Projects
sudo mkdir -p /root/.config

# Git
sudo pacman -S --noconfirm git
read -r -p "git config global user.name: " user && git config --global user.name "$user"
read -r -p "git config global user.email: " email && git config --global user.email "$email"

# C development
sudo pacman -S --noconfirm base-devel
sudo pacman -S --noconfirm clang
sudo pacman -S --noconfirm ccls

# Bash
sudo pacman -S --noconfirm bash-completion
sudo pacman -S --noconfirm bash-preexec
sudo pacman -S --noconfirm bash-language-server
sudo pacman -S --noconfirm shellcheck
git clone https://github.com/t-hg/bash-config $HOME/.config/bash
cat > $HOME/.bashrc <<'EOF'
. $HOME/.config/bash/bashrc
EOF
sudo git clone https://github.com/t-hg/bash-config /root/.config/bash
cat <<'EOF' | sudo tee /root/.bashrc
. /root/.config/bash/bashrc
EOF

# Go development
sudo pacman -S --noconfirm go
sudo pacman -S --noconfirm gopls
sudo pacman -S --noconfirm delve
cat >> $HOME/.bashrc <<'EOF'
# Go
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH
EOF

# Lazygit
sudo pacman -S --noconfirm lazygit
cat >> $HOME/.bashrc << 'EOF'
# Lazygit
alias lg='lazygit'
EOF

# Lua development
sudo pacman -S --noconfirm lua-language-server

# Web developement
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm curl
sudo pacman -S --noconfirm vscode-css-languageserver
sudo pacman -S --noconfirm typescript-language-server

# Editor
sudo pacman -Rcns --noconfirm vim
sudo pacman -Rcns --noconfirm nano
sudo pacman -S --noconfirm neovim
sudo rm -f /usr/bin/vi
sudo rm -f /usr/bin/vim
sudo ln -s /usr/bin/nvim /usr/bin/vi
sudo ln -s /usr/bin/nvim /usr/bin/vim
git clone https://github.com/t-hg/nvim-config $HOME/.config/nvim
sudo mkdir -p /root/.config/nvim
sudo cp $HOME/.config/nvim/lua/options.lua /root/.config/nvim/init.lua
cat <<'EOF' | sudo tee -a /etc/profile
export EDITOR=nvim
export VISUAL=nvim
EOF

# SSH
touch $HOME/.ssh/config
touch $HOME/.ssh/id_rsa
touch $HOME/.ssh/id_rsa.pub
chmod 600 $HOME/.ssh/id_rsa
cat > $HOME/.ssh/config <<'EOF'
Host *
  AddKeysToAgent 1h
EOF
sudo pacman -S --noconfirm keychain
cat >> $HOME/.bashrc <<'EOF'
eval "$(keychain --eval --noask --quiet --agents ssh $HOME/.ssh/id_rsa)"
EOF

# AUR helper
pushd $HOME/Downloads
wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
tar xvf yay.tar.gz
pushd yay
makepkg
sudo pacman -U yay*.zst
popd
rm -rf yay
rm -f yay.tar.gz
popd

# More applications
sudo pacman -S --noconfirm man-db
sudo pacman -S --noconfirm man-pages
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm thunderbird
sudo pacman -S --noconfirm bitwarden
sudo pacman -S --noconfirm ripgrep-all
sudo pacman -S --noconfirm tree
sudo pacman -S --noconfirm libreoffice-still
sudo pacman -S --noconfirm bc
sudo pacman -S --noconfirm inkscape
sudo pacman -S --noconfirm gimp
sudo pacman -S --noconfirm renameutils
sudo pacman -S --noconfirm ttf-iosevka-nerd
sudo pacman -S --noconfirm wl-clipboard
sudo pacman -S --noconfirm fwupd

set +x
echo "DONE"

