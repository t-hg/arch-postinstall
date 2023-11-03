info "Install AUR helper\n"
if is_installed yay; then 
  info "Package 'yay' is already installed\n" 
else
  install wget
  install go
  mkdir -p "$HOME"/Downloads
  pushd "$HOME"/Downloads
  wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
  tar xvf yay.tar.gz
  pushd yay
  makepkg
  sudo pacman -U --noconfirm yay*.zst
  popd
  rm -rf yay
  rm -f yay.tar.gz
  popd
fi
