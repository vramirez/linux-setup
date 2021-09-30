CONDA_BASE=$(conda info --base)
. $CONDA_BASE/etc/profile.d/conda.sh
ENVS_DIR=conda-envs
rm -rf $ENVS_DIR && mkdir $ENVS_DIR

ENVS=$(conda env list | grep '^\w' | cut -d' ' -f1)
for env in $ENVS; do
    #ssleep 10s
    conda activate $env
    conda env export > $ENVS_DIR/$env.yml
    echo "Exporting $env"
done

zip -rm ${ENVS_DIR}.zip $ENVS_DIR