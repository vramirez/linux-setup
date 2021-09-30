echo "Downloading Miniconda..."
CONDA_HOME=$HOME/miniconda
MINICONDA_FILE=./miniconda.sh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINICONDA_FILE
ENVS_DIR=conda-envs
sh $MINICONDA_FILE -b -p $CONDA_HOME
. $CONDA_HOME/etc/profile.d/conda.sh

unzip ${ENVS_DIR}.zip
echo "Installing conda envs"
conda update -n base -c defaults conda -y
for env in ${ENVS_DIR}/*.yml; do conda env create -f "$env" ; done

echo ". $CONDA_HOME/etc/profile.d/conda.sh" >> $HOME/.bashrc

echo "cleaning..."
rm $MINICONDA_FILE


echo "Conda installed successfully!"
