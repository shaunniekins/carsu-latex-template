# Carsu Latex Template

This repository is a LaTeX template for Caraga State University thesis and capstone projects created by [Shaun Niel Ochavo](https://github.com/shaunniekins).

## DIRECTORY STRUCTURE

### Main Files

- `thesis.tex`: This is the main file that compiles the entire document. It imports all other parts.
- `gatechthesis.cls`: This is the class file that defines the document format and layout.

### Front Matter Files (Document Setup)

- `sections/approvalPage.tex`: Contains the approval page format.
- `sections/dedication.tex`: Contains the dedication.
- `sections/acknowledgment.tex`: Where you write your acknowledgments.
- `sections/abstract.tex`: Contains the abstract of your thesis.
- `sections/abbrevs.tex`: Defines acronyms and abbreviations used in your document.

### Content Files

- `chapters/chapter1.tex`: Introduction and Background chapter.
- `chapters/chapter2.tex`: Review of Related Literature chapter.
- `chapters/chapter3.tex`: Methodology chapter.
- `chapters/chapter4.tex`: Results and Discussion chapter.
- `chapters/chapter5.tex`: Summary, Conclusion and Recommendation chapter.
- `sections/appendix.tex`: Appendices to your thesis.
- `sections/bionote.tex`: Contains the author bionotes.

### Reference Management

- `references.bib`: Bibliography entries in BibTeX format.

## HOW TO USE THIS TEMPLATE

1. Edit `thesis.tex` to update your title, name, and other basic information.
2. Modify the content in the chapter files under the `chapters/` directory and section files under `sections/`.
3. Update your references in `references.bib`.
4. Update your acknowledgments, abstract, dedication, and bionote files.
5. Compile the document using a LaTeX compiler (XeLaTeX or LuaLaTeX recommended due to fontspec).

## COMPILATION SEQUENCE

To compile the document (especially with `biblatex` and `glossaries`):

1. Run `xelatex` (or `lualatex`) on `thesis.tex`
2. Run `biber` on `thesis`
3. Run `makeglossaries thesis` (if using acronyms list)
4. Run `xelatex` (or `lualatex`) again (twice) on `thesis.tex`

Most LaTeX editors like TeXstudio, Overleaf, or VS Code with LaTeX Workshop extension can handle this automatically or be configured to do so.

## PAPER SIZE SETTINGS

The default paper size for this template is **US Letter (8.5" × 11")**.

To change the paper size:

1. Open `gatechthesis.cls`
2. Find the `geometry` package settings (around line 7):

   ```tex
   \RequirePackage[letterpaper, left=1.5in, right=1in, top=1in, bottom=1in]{geometry}
   ```

3. Replace `letterpaper` with your desired paper size:
   - For A4 paper: `a4paper`
   - For Legal paper: `legalpaper`
   - For Executive paper: `executivepaper`

You can also modify the margins as needed by changing the `left`, `right`, `top`, and `bottom` values.

## RECOMMENDED ORGANIZATION

For better organization:

1. Keep all figures and diagrams in the `figures/` directory
2. Place profile pictures and other images in the `images/` directory
3. Maintain one chapter per file in the `chapters/` directory
4. Keep front/back matter sections in the `sections/` directory

## REFERENCE GUIDE

- To add a citation: `\parencite{citation_key}` (for parenthetical) or `\textcite{citation_key}` (for in-text)
- To reference a figure: `\ref{fig:label_name}`
- To reference a table: `\ref{tab:label_name}`
- To reference a section: `\ref{sec:label_name}`
- To use an acronym: `\gls{acronym_key}` (first use) or `\gls{acronym_key}` (subsequent uses)

## TYPICAL WORKFLOW

1. Write your content in the chapter and section files
2. Add figures and tables as needed, placing image files in `figures/`
3. Add citations from the `references.bib` file using `\parencite` or `\textcite`
4. Define and use acronyms via the `glossaries` package and `sections/abbrevs.tex`
5. Compile and review the PDF output
6. Make adjustments and repeat until finished

## LATEX RESOURCES

For LaTeX help, refer to:

- [LaTeX Project](https://www.latex-project.org/)
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [BibLaTeX Documentation](https://ctan.org/pkg/biblatex)
- [Glossaries Package Documentation](https://ctan.org/pkg/glossaries)

## INSTALLATION

### TeX Distribution Installation

#### MacOS

- Install MacTeX from [https://www.tug.org/mactex/mactex-download.html](https://www.tug.org/mactex/mactex-download.html)
- After installing check the texlive directory and add to path if needed:

```zsh
echo 'export PATH="/usr/local/texlive/2025/bin/universal-darwin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Additional packages:

```zsh
brew install tex-fmt
```

For more detailed installation instructions for all platforms (Windows, Linux, and Mac) and LaTeX Workshop configuration, please refer to the official LaTeX Workshop Wiki: [https://github.com/James-Yu/LaTeX-Workshop/wiki/Install](https://github.com/James-Yu/LaTeX-Workshop/wiki/Install)

## VS Code Setup for LaTeX

To streamline your LaTeX workflow in Visual Studio Code:

1. **Install Extensions:**
   - **LaTeX Workshop:** Provides comprehensive LaTeX features

2. **Configure `settings.json`:**
   Modify your VS Code `settings.json` file (`Cmd + Shift + P` -> "Preferences: Open User Settings (JSON)"):

   ```json
   "latex-workshop.latex.tools": [
     {
       "name": "xelatex",
       "command": "xelatex",
       "args": [
         "-synctex=1",
         "-interaction=nonstopmode",
         "-file-line-error",
         "%DOC%"
       ]
     },
     {
       "name": "biber",
       "command": "biber",
       "args": [
         "%DOCFILE%"
       ]
     }
   ],
   "latex-workshop.latex.recipes": [
     {
       "name": "xelatex -> biber -> xelatex*2",
       "tools": [
         "xelatex",
         "biber",
         "xelatex",
         "xelatex"
       ]
     }
   ],
   "latex-workshop.latex.recipe.default": "xelatex -> biber -> xelatex*2",
   ```

---

*This template was created by Shaun Niel Ochavo (<https://github.com/shaunniekins>) and is freely available for academic use.*
