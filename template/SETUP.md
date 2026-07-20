# Setup and build guide

This guide covers both the reusable template and the personal CV at the repository root.

## What you need

- Git, to clone the repository
- Python 3, used only to run the build script
- A complete TeX distribution with LuaLaTeX, `latexmk`, and Font Awesome 5
- A PDF viewer
- Poppler, recommended for automated page-count and image-rendering checks

The build scripts use only the Python standard library. You do not need `pip`, a virtual environment, Node.js, or globally installed fonts.

## macOS

### Install with Homebrew

If Homebrew is not installed, follow the instructions at [brew.sh](https://brew.sh/). Then run:

```bash
brew install git python poppler
brew install --cask mactex-no-gui
```

MacTeX is a large download because it includes the complete TeX environment required by the project. After installation, open a new terminal. If the TeX commands are not found yet, refresh the shell path:

```bash
eval "$(/usr/libexec/path_helper -s)"
```

Verify the installation:

```bash
git --version
python3 --version
latexmk -v
lualatex --version
pdfinfo -v
pdftoppm -v
```

You can also install [MacTeX manually](https://www.tug.org/mactex/) instead of using Homebrew.

### Build the reusable template

From the `template/` directory:

```bash
python3 build_cv.py --clean
open cv.pdf
```

### Build the personal CV

From the repository root:

```bash
python3 build_cv.py --clean
open seb-cv.pdf
```

## Windows

1. Install [Git for Windows](https://git-scm.com/download/win).
2. Install Python from the official [Python downloads page](https://www.python.org/downloads/). The Python Install Manager is the recommended Windows installer.
3. Download and run the official [TeX Live Windows installer](https://www.tug.org/texlive/windows.html). Use the default complete installation so all required LaTeX packages are available.
4. For automated PDF validation, install Poppler from Windows Package Manager:

   ```powershell
   winget install --id oschwartz10612.Poppler -e
   ```

5. Open a new PowerShell window after the installers finish.

Verify the installation in PowerShell:

```powershell
git --version
py --version
latexmk -v
lualatex --version
pdfinfo -v
pdftoppm -v
```

### Build the reusable template

From the `template` directory:

```powershell
py .\build_cv.py --clean
Start-Process .\cv.pdf
```

### Build the personal CV

From the repository root:

```powershell
py .\build_cv.py --clean
Start-Process .\seb-cv.pdf
```

## Build everything

From the repository root on macOS:

```bash
python3 build_cv.py --clean
(cd template && python3 build_cv.py --clean)
```

From the repository root in Windows PowerShell:

```powershell
py .\build_cv.py --clean
Push-Location .\template
py .\build_cv.py --clean
Pop-Location
```

A successful full build produces or updates:

- `seb-cv.pdf`, the current personal CV
- the current-year PDF in `legacy/`
- `template/cv.pdf`, the reusable example

Use builds without `--clean` while editing for faster feedback. Always use `--clean` for final validation.

## Getting only the template

Git cannot clone a single directory directly. These commands use sparse checkout so only `template/` appears in the working tree:

```bash
git clone --filter=blob:none --no-checkout https://github.com/seblessa/Curriculum-Vitae.git my-cv
cd my-cv
git sparse-checkout set --no-cone /template/
git checkout
cd template
```

The commands work in macOS Terminal, Git Bash, and PowerShell.

## Workflow for agents

1. Check the working directory and existing changes with `git status --short`.
2. Confirm that Python, `latexmk`, and LuaLaTeX are available with the verification commands above.
3. For the personal CV, edit `seb-cv.tex` for content and `seb-cv.cls` for layout.
4. For the reusable version, edit `template/cv.tex` and `template/cv.cls`. Never copy personal CV content into the template.
5. Run the relevant build script with `--clean` for final validation. Do not invoke `latexmk` directly.
6. Confirm that the generated PDF has one A4 page, then inspect it visually for clipping, overlaps, and awkward line breaks.
7. After changing the personal CV, refresh the public preview when `pdftoppm` is available:

   ```bash
   pdftoppm -png -singlefile -r 120 seb-cv.pdf assets/cv-preview
   ```

## Troubleshooting

### A command is not found

Close and reopen the terminal after installation. On macOS, run the `path_helper` command above. On Windows, confirm that Git, Python, and TeX Live were added to `PATH` by their installers.

### A LaTeX package is missing

The complete MacTeX and TeX Live installations include the required packages. If you intentionally installed a minimal TeX environment, use TeX Live Manager to install the package named in the error. The project commonly needs `latexmk`, `fontawesome5`, `enumitem`, `ragged2e`, and `titlesec`.

### A bundled font is not found

Run the build command from the directory containing `build_cv.py`. The class files use relative paths to the bundled fonts.

### The script is not executable on macOS

Run it through Python instead:

```bash
python3 build_cv.py --clean
```
