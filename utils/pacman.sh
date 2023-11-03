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
    info "Package '$package' is already installed\n"
  else
    info "Installing package '$package'\n"
    run sudo pacman -S --noconfirm "$package"
  fi
}
