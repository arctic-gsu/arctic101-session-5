#!/bin/bash
#SBATCH --partition=qCPU24
#SBATCH --account=<account>       # training allocation for this session: univ1s16
#SBATCH --time=00:10:00           # HH:MM:SS -- always use this format
#SBATCH --mem=2G                  # memory is billed in 3 GB units, so 2G counts as 3 GB
#SBATCH --cpus-per-task=1
#SBATCH --job-name=penguins_onboarding
#SBATCH --output=penguins_%j.out
#SBATCH --error=penguins_%j.err

# ----------------------------------------------------------------------------
# ARCTIC Onboarding version of the penguins exercise.
# Uses the shared, pre-built environment /userapp/condaenv/onboarding.
#
# Download the Palmer Penguins dataset into /scratch/users/$USER/penguins.
# `wget -nc` (no-clobber) skips the download if the file is already there.
# Scratch is NOT safe storage: it can be wiped or lost at any time. That is
# fine here, because if the file disappears, wget just downloads it again.
# ----------------------------------------------------------------------------
mkdir -p /scratch/users/$USER/penguins
wget -nc -q -P /scratch/users/$USER/penguins https://gist.githubusercontent.com/slopp/ce3b90b9168f2f921784de84fa445651/raw/penguins.csv

# ----------------------------------------------------------------------------
# Fill in the five steps below, then submit with:  sbatch penguins_onboarding.sbatch
# ----------------------------------------------------------------------------

# TODO 1: make your per-job scratch folder, copy analyze.py into it, and cd in.
#         Slurm sets $SCRATCH but does NOT create the folder, so use mkdir -p.
#         (The job starts in the folder you ran sbatch from, so analyze.py is here.)

# TODO 2: load the miniconda3 module. Compute nodes start with a clean
#         environment, so every job script must set up its own software.

# Enable "conda activate" in this shell (module load alone is not enough).
source $(conda info --base)/etc/profile.d/conda.sh

# TODO 3: activate the shared onboarding environment:
#         /userapp/condaenv/onboarding

# TODO 4: run the analysis on the downloaded CSV:
#         python analyze.py /scratch/users/$USER/penguins/penguins.csv
#         It writes results.txt to the current folder, which is now $SCRATCH.

# TODO 5: copy results.txt back to the folder you submitted from, tagged with
#         the job ID, BEFORE the job ends. Then remove your scratch folder.
#         Destination: $SLURM_SUBMIT_DIR/results_$SLURM_JOB_ID.txt
