#Refresh outdated keyring
sudo pacman --no-confirm -Sy archlinux-keyring manjaro-keyring
sudo pacman-key --populate archlinux manjaro
sudo pacman-key --refresh-keys
sudo pacman --no-confirm -Syu

#Install TLP
pacman --no-confirm -Sy tilix
pacman --no-confirm -S tlp tlp-rdw acpi_call tp_smapi
systemctl enable tlp.service
systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

# Lenovo Throttling

pacman --no-confirm -S throttled
sudo systemctl enable --now lenovo_fix.service

#Install docker
sudo pacman --no-confirm -S docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

# Common installation (Snap, configs, etc)
sh common/all-common.sh
