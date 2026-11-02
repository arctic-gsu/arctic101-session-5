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

`penguins.csv` is **not** in this repo. The sbatch script downloads it once
into `/scratch/users/$USER/penguins/` using `wget -nc` (no-clobber). On the
first run you'll see wget fetching the file; on every rerun wget finds it
already there and skips the download. That keeps the exercise kind to the
network and fast to iterate on.

**Why not `$SCRATCH`?** On ARCTIC, `$SCRATCH` is allocated per job and wiped
when the job ends, so anything cached there disappears before the next run
could reuse it. `/scratch/users/$USER` persists across jobs, so it's the
right home for cached inputs.

The job itself does all its file IO inside `$SCRATCH` — the script creates
and `cd`s into it (Slurm sets the env var but doesn't create the directory
for you, so `mkdir -p $SCRATCH` is required), runs `analyze.py` (which
writes `results.txt` to the current directory), copies `results.txt` back
to `~/arctic101-session-5/penguins/results_<jobid>.txt` so it survives the
job, and finally `rm -rf $SCRATCH` to clean up. The general pattern is
**work in scratch, copy back when finished, then clean up**; scratch
purges run on a schedule, not per-job, so explicit cleanup is the norm.

## ARCTIC Onboarding version

The single-session ARCTIC Onboarding workshop uses `penguins_onboarding.sbatch`
instead of `penguins.sbatch`. It runs the same `analyze.py`, with three
differences:

- It activates the shared, pre-built environment `/userapp/condaenv/onboarding`,
  so you don't need your own conda environment yet.
- TODO 1 also copies `analyze.py` into `$SCRATCH` (the "copy input to scratch"
  step), so the whole job runs inside scratch.
- Results are copied back to the folder you submitted from
  (`$SLURM_SUBMIT_DIR/results_<jobid>.txt`).

```
cd penguins
# fill in <account> and the 5 TODOs
sbatch penguins_onboarding.sbatch
```

## Bonus: parallelize with a Slurm job array

Right now the job processes all three penguin species in a single Python
process. With only ~344 rows that's fast, but the same pattern scales poorly
once the dataset or the per-group work grows. As a stretch exercise, rewrite
the workload as a Slurm **job array** with one task per species.

Hints:
- `#SBATCH --array=0-2` launches three tasks; each sees a different
  `$SLURM_ARRAY_TASK_ID` (0, 1, or 2).
- Map the index to a species name (bash array or `case`) and pass it to a
  modified `analyze.py` that filters to that species before aggregating.
- Have each task write `results_<species>.txt` inside `$SCRATCH` and copy it
  back with `$SLURM_ARRAY_JOB_ID` + `$SLURM_ARRAY_TASK_ID` in the name.
  Combine them afterward with a short follow-up step (e.g. `cat results_*.txt`).
- Use `%A_%a` in `--output` so each array task gets its own log file:
  `#SBATCH --output=penguins_%A_%a.out`.

There's no answer key for this one — compare notes with a teammate.
