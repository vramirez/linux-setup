CONDA_HOME=$HOME/miniconda
MINICONDA_FILE=./common/miniconda.sh
#TLP repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install http://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release.fc$(rpm -E %fedora).noarch.rpm -y
sudo dnf upgrade --refresh -y
#Herramientas 
sudo dnf install gnome-tweak-tool tilix snapd pam_yubico -y
#TLP basic
sudo dnf install tlp tlp-rdw  -y
#TLP additional
sudo dnf install kernel-devel akmod-acpi_call akmod-tp_smapi -y
#Lenovo Throttling
sudo dnf install python3-cairo-devel cairo-gobject-devel gobject-introspection-devel dbus-glib-devel python3-devel make libX11-devel -y
git clone https://github.com/erpalma/lenovo-throttling-fix.git
sudo ./lenovo-throttling-fix/install.sh

rm -rf ./lenovo-throttling-fix
sudo dnf autoremove -y
#sudo mv /usr/share/budgie-extras-daemon/tilix_alt.bde  /usr/share/budgie-extras-daemon/tilix_alt.bde.bak


echo "Installing Docker"
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io -y
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

sh common/all-common.sh

sudo dnf autoremove -y
rm wget-log


## 
############# Disable WAYLAND
    ##Open /etc/gdm/custom.conf and uncomment WaylandEnable=false.
    ##Add the following line to the [daemon] section:

    ##DefaultSession=gnome-xorg.desktop

    #Save the custom.conf file.

