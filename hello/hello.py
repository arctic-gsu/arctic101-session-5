"""Minimal hello-world script for the ARCTIC 101 Session 5 hello job."""

import socket
import sys


def main() -> None:
    banner = "Hello from ARCTIC!"
    bar = "=" * len(banner)
    print(bar)
    print(banner)
    print(bar)
    print(f"Python version: {sys.version.splitlines()[0]}")
    print(f"Running on:     {socket.gethostname()}")


if __name__ == "__main__":
    main()
