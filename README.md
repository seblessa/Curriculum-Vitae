<div align="center">

<h1>Curriculum Vitae</h1>

<p>A clean, one-page A4 CV built with LuaLaTeX.</p>

<p><a href="./seb-cv.pdf"><strong>View the latest PDF</strong></a> · <a href="./seb-cv.tex">Browse the LaTeX source</a></p>

<a href="./seb-cv.pdf">
  <img src="./assets/cv-preview.png" alt="Preview of Sebastião Santos Lessa's CV" width="760">
</a>

</div>

## About

This repository contains the source and generated PDF for my CV. The layout is designed to keep professional experience prominent while fitting skills, certifications, education, and personal details into a readable two-column page.

- A4, single-page layout
- Clickable contact details and external links
- Bundled fonts for consistent rendering
- Reproducible build with one command

## Use this as a template

You need Python 3 and a TeX distribution that includes `latexmk` and LuaLaTeX. The fonts used by the CV are already included in the repository.

1. Fork the repository or clone it:

   ```bash
   git clone https://github.com/seblessa/Curriculum-Vitae.git my-cv
   cd my-cv
   ```

2. Replace the personal details and CV content in [`seb-cv.tex`](./seb-cv.tex).

3. Build the PDF:

   ```bash
   ./build_cv.py --clean
   ```

4. Open `seb-cv.pdf`. That is your finished CV.

To change colors, typography, spacing, or the column layout, edit [`seb-cv.cls`](./seb-cv.cls). Before publishing a fork, remove the existing personal PDFs from `legacy/`.

## Project structure

| Path | Purpose |
| --- | --- |
| `seb-cv.tex` | CV content |
| `seb-cv.cls` | Layout, typography, colors, and reusable commands |
| `build_cv.py` | Build entry point |
| `seb-cv.pdf` | Latest generated CV |
| `fonts/` | Bundled fonts and their licences |
| `legacy/` | Yearly PDF snapshots |
| `assets/` | README preview image |

## Building

For regular edits:

```bash
./build_cv.py
```

For a clean rebuild:

```bash
./build_cv.py --clean
```

Each successful build updates `seb-cv.pdf` and the current-year PDF in `legacy/`. Auxiliary LaTeX files stay in the ignored `.out/` directory.

After changing the layout, check that the PDF is still one page and that no text is clipped or overlapping.
