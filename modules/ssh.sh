. "./modules/bitwarden.sh"

install openssh
install keychain

mkdir -p "$HOME"/.ssh
touch "$HOME"/.ssh/id_rsa
chmod 600 "$HOME"/.ssh/id_rsa
touch "$HOME"/.ssh/id_rsa.pub

info "Getting SSH private key...\n"
bw get notes 'SSH Private Key' > "$HOME"/.ssh/id_rsa
info "Getting SSH public key...\n"
bw get notes 'SSH Public Key' > "$HOME"/.ssh/id_rsa.pub
info "Writing SSH config...\n"

cat > "$HOME"/.ssh/config <<'EOF'
Host *
  AddKeysToAgent 1h
EOF


if grep -q "keychain" "$HOME"/.bashrc; then
  info "'keychain' instruction already added to .bashrc"
else
  info "Adding 'keychain' instruction to .bashrc"
  cat >> "$HOME"/.bashrc <<'EOF'

# SSH Agent
eval "$(keychain --eval --noask --quiet --agents ssh $HOME/.ssh/id_rsa)"
EOF
fi

