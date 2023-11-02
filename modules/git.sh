info "Install and setup Git\n"
sudo pacman -S --noconfirm git
read -r -p "git config global user.name: " user && git config --global user.name "$user"
read -r -p "git config global user.email: " email && git config --global user.email "$email"
