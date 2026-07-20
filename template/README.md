# One-page CV template

## Quick start

1. Replace the example content in `cv.tex`.
2. Build the PDF:

   ```bash
   ./build_cv.py --clean
   ```

3. Open `cv.pdf`.

That is all you need for content changes.

## Requirements

- Python 3
- A TeX distribution with `latexmk`, LuaLaTeX, and Font Awesome 5

The Inter font and its OFL licence are included in `fonts/`.

## Customisation

| File | Change |
| --- | --- |
| `cv.tex` | Name, contact details, experience, education, and skills |
| `cv.cls` | Colors, typography, spacing, and column styles |
| `build_cv.py` | Input, output, or build behaviour |

Keep the finished CV to one page. After layout changes, check the generated PDF for clipped text, overlaps, and awkward line breaks.

This template is available under the MIT License. The bundled Inter font uses the SIL Open Font License included beside the font files.
