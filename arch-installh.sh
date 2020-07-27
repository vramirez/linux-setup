# Refresh outdated keyring
sudo pacman --noconfirm -Sy archlinux-keyring manjaro-keyring
sudo pacman-key --populate archlinux manjaro
sudo pacman-key --refresh-keys
sudo pacman --noconfirm -Syu

# Archlinux build packages (for building snap)
sudo pacman --noconfirm -Sy base-devel

# Tilix terminal
pacman --noconfirm -Sy tilix


# Install TLP
pacman --noconfirm -S tlp tlp-rdw acpi_call tp_smapi
systemctl enable tlp.service
systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

# Lenovo Throttling

pacman --noconfirm -S throttled
sudo systemctl enable --now lenovo_fix.service

# Install docker
sudo pacman --noconfirm -S docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

# Setup snap

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap


#  Common installation (Snap, configs, etc)
cd ..
sh common/all-common.sh


