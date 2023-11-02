info "No BEEP!\n"
sudo rmmod pcspkr || true
sudo cp etc/modprobe.d/nobeep.conf /etc/modprobe.d/
