install bitwarden-cli

function lock() {
  bw lock
}

trap lock EXIT

if [ "$(bw status | jq -r .status)" == "unauthenticated" ]; then
  info "Bitwarden login\n"
  bw login
else
  info "Already logged into Bitwarden\n"
fi

set +e
while [ -z "$BW_SESSION" ]; do
  info "Unlocking Bitwarden...\n"
  session="$(bw unlock --raw)"
  export BW_SESSION="$session"
done
set -e
