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

`penguins.csv` is **not** in this repo. Before submitting the job, you
download it from a public gist into your scratch space:

```
curl -o $SCRATCH/penguins.csv \
  https://gist.githubusercontent.com/slopp/ce3b90b9168f2f921784de84fa445651/raw/penguins.csv
```

The sbatch script passes `$SCRATCH/penguins.csv` as a command-line argument to
`analyze.py`, which reads it directly. Results (`results.txt`) are written to
the current directory — the same place Slurm puts the `.out` and `.err` files.

## Why pass `$SCRATCH` as an argument?

The `$SCRATCH` environment variable is set on the login node and propagated to
compute nodes by Slurm. Passing it explicitly as a CLI argument to
`analyze.py` (rather than hardcoding a path or reading the variable inside
Python) makes the data dependency visible in the sbatch script — anyone reading
the script can see exactly which file the analysis receives.
