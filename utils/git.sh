function clone() {
  repo="$1"
  path="$2"
  
  if test -d "$path"; then
    info "'$repo' already cloned to '$path'\n"
  else
    info "Cloning '$repo' to '$path'...\n"
    git clone "$repo" "$path"
  fi
}

function sudo_clone() {
  repo="$1"
  path="$2"
  
  if sudo test -d "$path"; then
    info "'$repo' already cloned to '$path'\n"
  else
    info "Cloning '$repo' to '$path'...\n"
    sudo git clone "$repo" "$path"
  fi
}

function git_config() {
  key="$1"
  cur="$(git config --global --get $key)"
  if [ -z "$cur" ]; then
    info "Setting '$key'...\n"
    read -r -p "$key" val && git config --global "$key" "$val"
  else
    info "'$key' already set to '$cur'\n"
  fi
}
