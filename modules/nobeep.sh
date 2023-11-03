info "No BEEP!\n"
sudo rmmod pcspkr || true
sudo bash -c 'echo blacklist pcspkr > /etc/modprobe.d/nobeep.conf'
