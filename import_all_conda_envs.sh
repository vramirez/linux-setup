CONDA_BASE=$(conda info --base)
. $CONDA_BASE/etc/profile.d/conda.sh

conda env create -f environment.yml
for f in *.yml; do conda env create -f "$i"; done

for f in *.yml; do head "$f"; done
