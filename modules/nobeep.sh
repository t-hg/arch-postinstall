info "No BEEP!\n"
sudo rmmod pcspkr || true
sudo_append "/etc/modprobe.d/nobeep.conf" 'blacklist pcspkr
'
