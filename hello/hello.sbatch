#!/bin/bash
#SBATCH --partition=qCPU24
#SBATCH --account=<account>       # find your allocation name in Elpis
#SBATCH --time=00:05:00
#SBATCH --mem=1G
#SBATCH --cpus-per-task=1
#SBATCH --job-name=hello_arctic
#SBATCH --output=hello_%j.out
#SBATCH --error=hello_%j.err

echo "Hostname:    $(hostname)"
echo "Date:        $(date)"
echo "Working dir: $(pwd)"
echo

python hello.py
