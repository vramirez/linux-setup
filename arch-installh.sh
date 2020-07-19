sudo pacman -Syu
#Install TLP

pacman -S tlp tlp-rdw acpi_call tp_smapi
systemctl enable tlp.service
systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

# Lenovo Throttling

pacman -S throttled
sudo systemctl enable --now lenovo_fix.service

#Install docker
sudo pacman -S docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

# Common installation (Snap, configs, etc)
sh common/all-common.sh
