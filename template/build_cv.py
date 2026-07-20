#!/usr/bin/env python3

import argparse
import shutil
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parent
OUTPUT_DIRECTORY = ROOT / ".out"


def main() -> None:
    parser = argparse.ArgumentParser(description="Build the CV with LuaLaTeX.")
    parser.add_argument("--clean", action="store_true", help="Start from a clean build directory.")
    args = parser.parse_args()

    if args.clean and OUTPUT_DIRECTORY.exists():
        shutil.rmtree(OUTPUT_DIRECTORY)

    OUTPUT_DIRECTORY.mkdir(exist_ok=True)
    subprocess.run(
        [
            "latexmk",
            "-lualatex",
            "-interaction=nonstopmode",
            "-halt-on-error",
            "-outdir=.out",
            "cv.tex",
        ],
        cwd=ROOT,
        check=True,
    )
    shutil.copy2(OUTPUT_DIRECTORY / "cv.pdf", ROOT / "cv.pdf")
    print(f"Updated {ROOT / 'cv.pdf'}")


if __name__ == "__main__":
    main()
