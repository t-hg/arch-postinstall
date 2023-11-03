info "Install and setup Git\n"

install git

if grep -q "name =" "$HOME"/.gitconfig; then
  info "'user.name' is already configured\n"
else
  info "Configuring 'user.name'...\n"
  read -r -p "user.name: " user && git config --global user.name "$user"
fi

if grep -q "email =" "$HOME"/.gitconfig; then
  info "'user.email' is already configured\n"
else
  info "Configuring 'user.email'...\n"
  read -r -p "user.email: " email && git config --global user.email "$email"
fi

install lazygit
if grep -q "Lazygit" "$HOME"/.bashrc; then
  info "'Lazygit' already configured in '$HOME/.bashrc'\n"
else
  info "Configuring 'Lazygit' in '$HOME/.bashrc'...\n"
  cat >> $HOME/.bashrc << 'EOF'

# Lazygit
alias lg='lazygit'
EOF
fi
