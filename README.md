# ARCTIC 101 — Session 5: Running Workloads on ARCTIC with Slurm

This repo contains the hands-on exercises for **Session 5** of the ARCTIC 101
workshop series. By the end of the session you will have submitted two batch
jobs to the GSU ARCTIC cluster: a hello-world sanity check and a small data
analysis on the Palmer Penguins dataset.

## What this session covers

- Anatomy of a Slurm batch script (`#SBATCH` directives, body)
- Submitting jobs with `sbatch` and inspecting them with `squeue` / `sacct`
- Loading software with `module` and activating a conda environment inside a job
- Reading input data from scratch (`$SCRATCH`) inside a batch job

## Prerequisites

- Sessions 1–4 complete (terminal, Git, SSH to ARCTIC, environment + data setup)
- A conda environment at `/userapp/condaenv/<campusid>_101` with Python 3.12
  and `pandas` installed
- Replace `<campusid>` everywhere with your own GSU CampusID

## Repo layout

```
.
├── hello/              # Exercise 1: complete, runnable hello-world job
│   ├── hello.sbatch
│   └── hello.py
└── penguins/           # Exercise 2: partial template you fill in
    ├── README.md
    ├── penguins.sbatch
    └── analyze.py
```

## How to use

On an ARCTIC login node:

```
git clone https://github.com/arctic-gsu/arctic101-session-5.git
cd arctic101-session-5
```

Then for each exercise:

```
cd hello
sbatch hello.sbatch        # submit as-is
```

```
cd ../penguins
# download the Palmer Penguins dataset to your scratch space
curl -o $SCRATCH/penguins.csv \
  https://gist.githubusercontent.com/slopp/ce3b90b9168f2f921784de84fa445651/raw/penguins.csv

# edit penguins.sbatch and fill in the TODOs (substitute <campusid>)
sbatch penguins.sbatch
```

Watch your job with `squeue -u $USER` and read the `*_<jobid>.out` /
`*_<jobid>.err` files when it finishes.

For more on ARCTIC, see the wiki: https://arcwiki.rs.gsu.edu
