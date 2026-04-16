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
# Fill in the three steps below. Replace <campusid> with your GSU CampusID.
# Submit with:  sbatch penguins.sbatch
# ----------------------------------------------------------------------------

# TODO 1: load the conda module -- compute nodes start with a clean environment
#         and have no `conda` on PATH by default.

# TODO 2: activate your Session 5 conda environment so `python` resolves to the
#         interpreter that has pandas installed.

# TODO 3: run the analysis script, passing the path to penguins.csv on scratch
#         as a command-line argument (analyze.py reads the path from sys.argv[1]
#         and writes results.txt to the current directory).
