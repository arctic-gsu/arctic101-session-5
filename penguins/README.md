# Exercise 2: Palmer Penguins analysis

A small pandas job that summarizes the Palmer Penguins dataset by species and
writes the result to a text file.

## What `analyze.py` does

- Reads `./penguins.csv` from the current working directory.
- Groups by `species` and computes counts plus the mean of `bill_length_mm`,
  `bill_depth_mm`, `flipper_length_mm`, and `body_mass_g`. Rows missing any of
  those numeric columns are dropped.
- Writes a formatted summary (header, table, footer with row counts and a
  timestamp) to `./results.txt` and prints the same to stdout so it shows up in
  the Slurm `.out` file.

## Where the data comes from and where results go

`penguins.csv` is **not** in this repo. The dataset lives on scratch at
`/scratch/users/<campusid>/penguins.csv` (set up in Session 4). The sbatch
script copies it into the job's working directory before running the analysis,
and after the analysis finishes it copies `results.txt` back to
`/scratch/users/<campusid>/`.

## Why we stage data instead of reading directly from scratch

For this tiny dataset the difference is invisible, but the staging pattern is
the one you will reuse for real jobs. Compute nodes have local scratch that is
faster than the shared filesystem, results are easier to collect when they land
in a single working directory, and explicit `cp` steps make the job's inputs
and outputs obvious to anyone reading the script later. Building the habit now
on a tiny CSV pays off when you start running on hundreds of GB.
