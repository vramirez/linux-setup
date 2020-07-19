echo "Downloading Miniconda..."
CONDA_HOME=$HOME/miniconda
MINICONDA_FILE=./miniconda.sh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINICONDA_FILE

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

echo "cleaning..."
rm $MINICONDA_FILE


echo "Conda installed successfully!"
