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
# Download the Palmer Penguins dataset into your persistent per-user scratch.
# `wget -nc` (no-clobber) means reruns will see the file already exists and
# skip the fetch. We use /scratch/users/$USER (not $SCRATCH) because $SCRATCH
# is wiped at the end of every job.
# ----------------------------------------------------------------------------
mkdir -p /scratch/users/$USER/penguins
wget -nc -P /scratch/users/$USER/penguins https://gist.githubusercontent.com/slopp/ce3b90b9168f2f921784de84fa445651/raw/penguins.csv

# ----------------------------------------------------------------------------
# Fill in the five steps below.
# Submit with:  sbatch penguins.sbatch
# ----------------------------------------------------------------------------

# TODO 1: create and cd into $SCRATCH -- this is your per-job ephemeral
#         workspace. Slurm sets the $SCRATCH env var but does NOT create the
#         directory; a bare `cd $SCRATCH` will fail. Use `mkdir -p` so it
#         works even on first run, then cd in so the files your job writes
#         land inside $SCRATCH.

# TODO 2: load the miniconda3 module -- compute nodes start with a clean
#         environment and have no `conda` on PATH by default.

# Enable "conda activate" in this shell (module load alone is not enough).
source $(conda info --base)/etc/profile.d/conda.sh

# TODO 3: activate your Session 5 conda environment so `python` resolves to
#         the interpreter that has pandas installed.

# TODO 4: run the analysis script. Pass the cached CSV path as sys.argv[1]:
#         /scratch/users/$USER/penguins/penguins.csv
#         analyze.py will write results.txt to the current directory, which
#         (thanks to TODO 1) is $SCRATCH.

# TODO 5: copy results.txt out of $SCRATCH to a durable location before
#         cleaning up. Suggested destination (tagged with the job id so
#         multiple runs don't overwrite each other):
#         ~/arctic101-session-5/penguins/results_$SLURM_JOB_ID.txt
#         Then `rm -rf $SCRATCH` to release the space -- scratch purges run
#         on a schedule, not per-job, so explicit cleanup is the norm.
