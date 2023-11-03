info "Install and setup Git\n"
install git
read -r -p "git config global user.name: " user && git config --global user.name "$user"
read -r -p "git config global user.email: " email && git config --global user.email "$email"
