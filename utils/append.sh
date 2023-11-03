function append() {
  file="$1"
  content="$2"
  pattern="$(echo -n "$content" | tr '\n' ' ')"
  if cat "$file" | tr '\n' ' ' | grep -F -q "$pattern"; then
    log "'$file' already contains '$content'\n"
  else
    log "Writing to '$file'...\n"
    if [ -s "$file" ]; then
      log "'$file' is not empty\n"
      log "Adding newline to '$file'\n"
      echo >> "$file"
    fi
    echo -n "$content" | tee -a "$file" 
  fi
}

function sudo_append() {
  file="$1"
  content="$2"
  pattern="$(echo -n "$content" | tr '\n' ' ')"
  if sudo cat "$file" | tr '\n' ' ' | grep -F -q "$pattern"; then
    log "'$file' already contains '$content'\n"
  else
    log "Writing to '$file'...\n"
    if [ -s "$file" ]; then
      log "'$file' is not empty\n"
      log "Adding newline to '$file'\n"
      echo | sudo tee -a "$file"
    fi
    echo -n "$content" | sudo tee -a "$file" 
  fi
}
