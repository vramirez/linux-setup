CONDA_HOME=$HOME/miniconda

sudo apt update -y
sudo apt install gnome-tweak-tool git tlp tlp-rdw acpi-call-dkms tp-smapi-dkms acpi-call-dkms build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel  -y
git clone https://github.com/erpalma/lenovo-throttling-fix.git
sudo ./lenovo-throttling-fix/install.sh

sudo mv /usr/share/budgie-extras-daemon/tilix_alt.bde  /usr/share/budgie-extras-daemon/tilix_alt.bde.bak
sudo cp tlp.txt /etc/default/tlp
sudo cp lenovo_fix.conf /etc/lenovo_fix.conf
echo "Downloading Miniconda and continuing..."

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda.sh&

echo "Installing Snaps"

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

sh miniconda.sh -b -p $CONDA_HOME
. $CONDA_HOME/etc/profile.d/conda.sh

echo "Installing conda envs"
conda update -n base -c defaults conda -y
conda env create -f conda-envs/ig-api.yml 
conda env create -f conda-envs/data-mining.yml
conda env create -f conda-envs/twpy3.yml 
conda env create -f conda-envs/uribot.yml 
conda env create -f conda-envs/yutub.yml 

echo ". $CONDA_HOME/etc/profile.d/conda.sh" >> $HOME/.bashrc

##PENDING
# DOCUMENTAR EN EL README EL LENOVO THERMAL

# 
