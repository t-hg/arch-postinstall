info "No BEEP!\n"
sudo rmmod pcspkr || true
cat <<'EOF' | sudo tee -a /etc/modprobe.d/nobeep.conf > /dev/null 
blacklist pcspkr
EOF
