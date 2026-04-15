"""Palmer Penguins summary for ARCTIC 101 Session 5.

Reads ./penguins.csv (staged into the job working directory by the sbatch
script) and writes a human-readable per-species summary to ./results.txt.
"""

from datetime import datetime

import pandas as pd

INPUT_PATH = "./penguins.csv"
OUTPUT_PATH = "./results.txt"

NUMERIC_COLS = [
    "bill_length_mm",
    "bill_depth_mm",
    "flipper_length_mm",
    "body_mass_g",
]


def main() -> None:
    df = pd.read_csv(INPUT_PATH)
    total_rows = len(df)

    clean = df.dropna(subset=NUMERIC_COLS)
    summary = clean.groupby("species").agg(
        count=("species", "size"),
        bill_length_mm=("bill_length_mm", "mean"),
        bill_depth_mm=("bill_depth_mm", "mean"),
        flipper_length_mm=("flipper_length_mm", "mean"),
        body_mass_g=("body_mass_g", "mean"),
    )
    summary = summary.round(2)

    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    lines = [
        "Palmer Penguins -- per-species summary",
        "=" * 60,
        summary.to_string(),
        "=" * 60,
        f"Total rows in dataset: {total_rows}",
        f"Rows used (no NaN in numeric cols): {len(clean)}",
        f"Generated: {timestamp}",
    ]
    report = "\n".join(lines) + "\n"

    with open(OUTPUT_PATH, "w") as f:
        f.write(report)
    print(report)


if __name__ == "__main__":
    main()
