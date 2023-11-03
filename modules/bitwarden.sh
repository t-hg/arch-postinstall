install bitwarden-cli

if [ "$(bw status | jq -r .status)" == "unauthenticated" ]; then
  info "Bitwarden login\n"
  ogin
else
  info "Already logged into Bitwarden\n"
fi
