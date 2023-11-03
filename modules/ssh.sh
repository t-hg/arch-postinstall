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
append "$HOME/.ssh/config" 'Host *
  AddKeysToAgent 1h
'

append "$HOME/.bashrc" '# SSH Agent
eval "$(keychain --eval --noask --quiet --agents ssh $HOME/.ssh/id_rsa)"
'
