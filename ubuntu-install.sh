sudo add-apt-repository ppa:linrunner/tlp -y
sudo apt update -y
sudo apt install gnome-tweaks tlp tlp-rdw acpi-call-dkms tp-smapi-dkms acpi-call-dkms build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel curl apt-transport-https ca-certificates software-properties-common -y 
git clone https://github.com/erpalma/lenovo-throttling-fix.git && sudo ./lenovo-throttling-fix/install.sh

sudo mv /usr/share/budgie-extras-daemon/tilix_alt.bde  /usr/share/budgie-extras-daemon/tilix_alt.bde.bak

echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
sudo apt update && sudo apt install docker-ce -y 
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sh common/all-common.sh
