install bash-completion
install bash-preexec
install bash-language-server
install shellcheck
install git

clone "https://github.com/t-hg/bash-config" "$HOME/.config/bash"
append "$HOME/.bashrc" '# Source custom configurations
. "$HOME"/.config/bash/bashrc
'

sudo_clone "https://github.com/t-hg/bash-config" "/root/.config/bash"
sudo_append "/root/.bashrc" '# Source custom configurations
. /root/.config/bash/bashrc
'
