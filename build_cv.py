#!/usr/bin/env python3

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
import unicodedata
from datetime import date
from pathlib import Path


ROOT = Path(__file__).resolve().parent
MAIN_TEX = "seb-cv.tex"
MAIN_PDF = "seb-cv.pdf"
OUTPUT_DIRECTORY_NAME = ".out"
OUTPUT_DIRECTORY = ROOT / OUTPUT_DIRECTORY_NAME
LEGACY_DIRECTORY = ROOT / "personal-legacy"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build the CV PDF using a local .out directory for reusable "
            "LaTeX build files."
        )
    )
    parser.add_argument(
        "--clean",
        action="store_true",
        help="Remove the .out directory before building.",
    )
    return parser.parse_args()


def run_command(command: list[str], cwd: Path) -> None:
    result = subprocess.run(command, cwd=cwd)
    if result.returncode != 0:
        sys.exit(result.returncode)


def legacy_pdf_path(year: int) -> Path:
    existing_paths = sorted(
        path
        for path in LEGACY_DIRECTORY.glob(f"*-CV-{year}.pdf")
        if path.is_file()
    )
    if existing_paths:
        return existing_paths[0]

    filename = unicodedata.normalize("NFD", f"Sebastião-CV-{year}.pdf")
    return LEGACY_DIRECTORY / filename


def main() -> None:
    args = parse_args()
    main_tex_path = ROOT / MAIN_TEX

    if not main_tex_path.exists():
        raise SystemExit(f"Missing main TeX file: {main_tex_path}")

    if args.clean and OUTPUT_DIRECTORY.exists():
        shutil.rmtree(OUTPUT_DIRECTORY)

    OUTPUT_DIRECTORY.mkdir(parents=True, exist_ok=True)

    print(f"Building CV in {ROOT}...")
    run_command(
        [
            "latexmk",
            "-lualatex",
            "-interaction=nonstopmode",
            "-halt-on-error",
            "-e",
            "$max_repeat=10",
            f"-outdir={OUTPUT_DIRECTORY_NAME}",
            MAIN_TEX,
        ],
        cwd=ROOT,
    )

    built_pdf_path = OUTPUT_DIRECTORY / MAIN_PDF
    if not built_pdf_path.exists():
        raise SystemExit(f"Build finished without creating {built_pdf_path}")

    pdf_path = ROOT / MAIN_PDF
    shutil.copy2(built_pdf_path, pdf_path)

    LEGACY_DIRECTORY.mkdir(parents=True, exist_ok=True)
    legacy_path = legacy_pdf_path(date.today().year)
    shutil.copy2(built_pdf_path, legacy_path)

    print(f"Updated PDF: {pdf_path}")
    print(f"Updated legacy copy: {legacy_path}")
    print(f"Kept LaTeX build files in: {OUTPUT_DIRECTORY}")


if __name__ == "__main__":
    main()
