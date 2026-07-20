# Agent Instructions

- Use `./build_cv.py` to compile the CV. Use `./build_cv.py --clean` for final validation.
- Do not compile with raw `latexmk` unless you are changing the build script itself.
- Every successful build updates `seb-cv.pdf` and the current-year PDF in `legacy/`.
- After compiling, render and inspect the PDF visually; a successful LaTeX build is not enough.
- Keep the CV to one page and preserve the clean two-column layout.
- Use `seb-cv.tex` for content and `seb-cv.cls` for visual structure/style.
- At the end of every change, commit and push all changes in the repository.
