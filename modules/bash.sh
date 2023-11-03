install bash-completion
install bash-preexec
install bash-language-server
install shellcheck
install git

if test -d "$HOME/.config/bash"; then
  info "'t-hg/bash-config' already cloned to '$HOME/.config/bash'\n"
else
  info "Cloning 't-hg/bash-config' to '$HOME/.config/bash'\n"
  git clone https://github.com/t-hg/bash-config "$HOME"/.config/bash
fi

if grep -q "Source custom configurations" "$HOME"/.bashrc; then
  info "'$HOME/.bashrc' already sources custom configurations\n"
else
  info "Sourcing custom configurations in '$HOME/.bashrc'...\n"
  cat >> $HOME/.bashrc <<'EOF'

# Source custom configurations
. "$HOME"/.config/bash/bashrc
EOF
fi


if sudo test -d /root/.config/bash; then
  info "'t-hg/bash-config' already cloned to '/root/.config/bash'\n"
else
  info "Cloning 't-hg/bash-config' to '/root/.config/bash'\n"
  sudo git clone https://github.com/t-hg/bash-config /root/.config/bash
fi

if sudo grep -q "Source custom configurations" /root/.bashrc; then
  info "'/root/.bashrc' already sources custom configurations\n"
else
  info "Sourcing custom configurations in '/root/.bashrc'...\n"
  cat <<'EOF' | sudo tee -a /root/.bashrc > /dev/null

# Source custom configurations
. /root/.config/bash/bashrc
EOF
fi
