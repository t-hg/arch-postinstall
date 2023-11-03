function is_installed() {
  package="$1"
  if pacman -Qi "$package" > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

function install() {
  package="$1"
  if is_installed "$package"; then
    log "Package '$package' is already installed\n"
  else
    log "Installing package '$package'\n"
    sudo pacman -S --noconfirm "$package"
  fi
}


function uninstall() {
  package="$1"
  if is_installed "$package"; then
    log "Uninstalling package '$package'\n"
    sudo pacman -Rcns "$package"
  else
    log "Package '$package' is not installed\n"
  fi
}
