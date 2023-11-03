info "Gimme fast mirrors...\n"
install rsync
install reflector
sudo reflector --sort rate --country Switzerland --save /etc/pacman.d/mirrorlist
