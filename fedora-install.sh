CONDA_HOME=$HOME/miniconda
MINICONDA_FILE=./miniconda.sh
#TLP repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install http://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release.fc$(rpm -E %fedora).noarch.rpm -y
sudo dnf upgrade --refresh -y
#Herramientas 
sudo dnf install gnome-tweak-tool tilix snapd -y
#TLP basic
sudo dnf install tlp tlp-rdw  -y
#TLP additional
sudo dnf install kernel-devel akmod-acpi_call akmod-tp_smapi -y
#Lenovo Throttling
sudo dnf install python3-cairo-devel cairo-gobject-devel gobject-introspection-devel dbus-glib-devel python3-devel make libX11-devel -y
git clone https://github.com/erpalma/lenovo-throttling-fix.git
sudo ./lenovo-throttling-fix/install.sh

#sudo mv /usr/share/budgie-extras-daemon/tilix_alt.bde  /usr/share/budgie-extras-daemon/tilix_alt.bde.bak
sudo cp tlp.txt /etc/default/tlp
sudo cp lenovo_fix.conf /etc/lenovo_fix.conf

echo "Installing Docker"
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io -y
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker


echo "Downloading Miniconda and continuing..."

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINICONDA_FILE&

echo "Installing Snaps"
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install snapd
sudo snap install firefox
sudo snap install code --classic
sudo snap install whatsdesk
sudo snap install skype --classic
sudo snap install slack --classic
sudo snap install teams-for-linux
sudo snap install spotify
sudo snap install onenote-desktop --beta
sudo snap install simplenote
sudo snap install vlc
sudo snap install libreoffice

sh $MINICONDA_FILE -b -p $CONDA_HOME
. $CONDA_HOME/etc/profile.d/conda.sh

echo "Installing conda envs"
conda update -n base -c defaults conda -y
conda env create -f conda-envs/ig-api.yml 
conda env create -f conda-envs/data-mining.yml
conda env create -f conda-envs/twpy3.yml 
conda env create -f conda-envs/uribot.yml 
conda env create -f conda-envs/yutub.yml 

echo ". $CONDA_HOME/etc/profile.d/conda.sh" >> $HOME/.bashrc

git config --global user.email "ramirez.vmanuel@gmail.com"
git config --global user.name "Victor M. Ramirez"

rm $MINICONDA_FILE
rm wget-log
