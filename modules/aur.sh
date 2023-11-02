info "Install AUR helper\n"
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm go
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
