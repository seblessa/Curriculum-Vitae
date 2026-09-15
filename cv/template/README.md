# One-page CV template

## Quick start

1. Replace the example content in `cv.tex`.
2. Build the PDF:

   macOS:

   ```bash
   python3 build_cv.py --clean
   ```

   Windows PowerShell:

   ```powershell
   py .\build_cv.py --clean
   ```

3. Open `cv.pdf`.

That is all you need for content changes.

## Installation

Follow the complete [macOS and Windows setup guide](./SETUP.md). In short, you need Python 3 and a complete TeX distribution with `latexmk`, LuaLaTeX, and Font Awesome 5.

The build uses only the Python standard library. The Inter font and its OFL licence are included in `fonts/`.

## Customisation

| File | Change |
| --- | --- |
| `cv.tex` | Name, contact details, experience, education, and skills |
| `cv.cls` | Colors, typography, spacing, and column styles |
| `build_cv.py` | Input, output, or build behaviour |
| `SETUP.md` | Installation, agent workflow, and troubleshooting |

Keep the finished CV to one page. After layout changes, check the generated PDF for clipped text, overlaps, and awkward line breaks.

This template is available under the MIT License. The bundled Inter font uses the SIL Open Font License included beside the font files.
