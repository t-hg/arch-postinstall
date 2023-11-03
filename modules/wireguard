install wireguard-tools
. "./modules/bitwarden.sh"
bw get attachment X13.conf --itemid="354a5107-10ae-430a-ac7e-b09b00f5f116" --raw | sudo tee /etc/wireguard/vpn-home.conf > /dev/null
sudo chmod 600 /etc/wireguard/vpn-home.conf
sudo nmcli con import type wireguard file /etc/wireguard/vpn-home.conf
nmcli con modify vpn-home autoconnect no
