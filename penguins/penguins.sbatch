#!/bin/bash
#SBATCH --partition=qCPU24
#SBATCH --account=<account>       # find your allocation name in Elpis
#SBATCH --time=00:10:00
#SBATCH --mem=2G
#SBATCH --cpus-per-task=1
#SBATCH --job-name=penguins_analysis
#SBATCH --output=penguins_%j.out
#SBATCH --error=penguins_%j.err

# ----------------------------------------------------------------------------
# Fill in the five steps below. Replace <campusid> with your GSU CampusID.
# Submit with:  sbatch penguins.sbatch
# ----------------------------------------------------------------------------

# TODO 1: create your per-job scratch directory -- $SCRATCH is set by Slurm but
#         the directory does not exist yet. Use mkdir -p so it works even if it
#         already exists.

# TODO 2: download the Palmer Penguins dataset into your scratch directory --
#         do this BEFORE loading miniconda3 to avoid a library conflict with curl.
#         URL: https://gist.githubusercontent.com/slopp/ce3b90b9168f2f921784de84fa445651/raw/penguins.csv

# TODO 3: load the conda module -- compute nodes start with a clean environment
#         and have no `conda` on PATH by default.

# Enable "conda activate" in this shell (module load alone is not enough).
source $(conda info --base)/etc/profile.d/conda.sh

# TODO 4: activate your Session 5 conda environment so `python` resolves to the
#         interpreter that has pandas installed.

# TODO 5: run the analysis script, passing the path to penguins.csv on scratch
#         as a command-line argument (analyze.py reads the path from sys.argv[1]
#         and writes results.txt to the current directory).
