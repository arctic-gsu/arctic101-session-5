#!/bin/bash
#SBATCH --partition=qCPU24
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

# TODO 1: load the conda module -- compute nodes start with a clean environment
#         and have no `conda` on PATH by default.

# TODO 2: activate your Session 5 conda environment so `python` resolves to the
#         interpreter that has pandas installed.

# TODO 3: stage the input dataset from scratch into the job's working directory
#         so the analysis script can read it from a local relative path.

# TODO 4: run the analysis script (analyze.py reads ./penguins.csv and writes
#         ./results.txt).

# TODO 5: copy the results file back to your scratch space so it survives after
#         the job's working directory is cleaned up.
