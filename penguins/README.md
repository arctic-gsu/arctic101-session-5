# Exercise 2: Palmer Penguins analysis

A small pandas job that summarizes the Palmer Penguins dataset by species and
writes the result to a text file.

## What `analyze.py` does

- Reads `penguins.csv` from the path passed as a command-line argument.
- Groups by `species` and computes counts plus the mean of `bill_length_mm`,
  `bill_depth_mm`, `flipper_length_mm`, and `body_mass_g`. Rows missing any of
  those numeric columns are dropped.
- Writes a formatted summary (header, table, footer with row counts and a
  timestamp) to `./results.txt` and prints the same to stdout so it shows up in
  the Slurm `.out` file.

## Where the data comes from and where results go

`penguins.csv` is **not** in this repo. One of the TODOs in the sbatch script
has you `curl` it from a public gist into `$SCRATCH` as part of the job. The
`$SCRATCH` environment variable is available on compute nodes and points to
your scratch directory.

The sbatch script then passes `$SCRATCH/penguins.csv` as a command-line
argument to `analyze.py`, which reads it directly. Results (`results.txt`) are
written to the current directory — the same place Slurm puts the `.out` and
`.err` files.

## Why download data inside the job?

Downloading data as an explicit step in the sbatch script makes the job
self-contained — anyone reading the script can see exactly where the input
comes from. It also demonstrates that compute nodes on ARCTIC have internet
access, which is useful for jobs that pull data from APIs or remote storage.
