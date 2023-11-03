. "./modules/bitwarden.sh"
mkdir -p "$HOME"/.ssh
touch "$HOME"/.ssh/id_rsa
touch "$HOME"/.ssh/id_rsa.pub
touch "$HOME"/.ssh/config
chmod 600 "$HOME"/.ssh/id_rsa
info "Getting SSH private key...\n"
bw get notes 'SSH Private Key' > "$HOME"/.ssh/id_rsa
info "Getting SSH public key...\n"
bw get notes 'SSH Public Key' > "$HOME"/.ssh/id_rsa.pub
info "Writing SSH config...\n"
cat > "$HOME"/.ssh/config <<'EOF'
Host *
  AddKeysToAgent 1h
EOF
