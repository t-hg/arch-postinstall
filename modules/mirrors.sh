info "Gimme fast mirrors...\n"
sudo pacman -S --noconfirm rsync
sudo pacman -S --noconfirm reflector
sudo reflector --sort rate --country Switzerland --save /etc/pacman.d/mirrorlist
