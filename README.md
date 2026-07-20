# Seb CV

LaTeX project for Sebastião Santos Lessa's one-page CV.

## Build

Always compile through the project script:

```bash
./build_cv.py
```

For a clean build:

```bash
./build_cv.py --clean
```

The script uses `latexmk` with LuaLaTeX, keeps auxiliary LaTeX files in `.out/`, updates `seb-cv.pdf`, and updates the yearly copy in `legacy/`.

## Legacy PDFs

Every successful build writes a copy to `legacy/` for the current year.

If a file for the current year already exists, the script replaces it. If not, it creates a new yearly file using the existing naming pattern.

## Visual QA

After compiling, always verify the generated PDF visually. The build passing is not enough.

Recommended check:

```bash
mkdir -p tmp/pdfs
pdftoppm -png -r 180 seb-cv.pdf tmp/pdfs/seb-cv
```

Inspect the rendered PNG and confirm:

- the CV is still one page;
- no text is clipped or overlapping;
- the two-column layout still feels balanced;
- headings, bullets, dates, and links are aligned cleanly;
- the professional experience section remains clear and chronological.

Remove temporary render files after validation.

## Agent Notes

Use `seb-cv.tex` for content changes and `seb-cv.cls` for layout/style changes. Keep the CV to one page. Do not compile with raw `latexmk` unless you are modifying `build_cv.py`; use `./build_cv.py` instead.
