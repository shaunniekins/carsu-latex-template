\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass{report}

% package imports
\RequirePackage{graphicx}
\RequirePackage[letterpaper, left=1.5in, right=1in, top=1in, bottom=1in]{geometry}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{times}
\RequirePackage[explicit]{titlesec}
\RequirePackage[titles]{tocloft}
\RequirePackage{ifoddpage}
\RequirePackage{rotating}
\RequirePackage[backend=biber,sorting=nyt, style=apa]{biblatex}
\RequirePackage[toc,page]{appendix}
\RequirePackage[normalem]{ulem}
\RequirePackage{url}
\RequirePackage{siunitx}
\RequirePackage[bookmarks=true,hidelinks]{hyperref}
\RequirePackage{bookmark}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[acronym,nogroupskip,nopostdot]{glossaries}
\RequirePackage{doi}
\RequirePackage{fancyhdr}

\sisetup{
  sticky-per=true,
  detect-mode=true,
  per-mode = symbol-or-fraction
}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\doublespacing
\AtBeginDocument{\renewcommand{\ref}[1]{\autoref{#1}}}
\makeglossaries
\urlstyle{same}
\hbadness=9000
\setcounter{biburlnumpenalty}{99999}
\hypersetup{
  colorlinks,
  linkcolor={black},
  citecolor={black},
  urlcolor={black}
}

\makeatletter

\bookmarksetup{%
  depth=1,
  addtohook={%
    \ifnum 0=\bookmarkget{level}\relax
    \renewcommand*{\numberline}[1]{#1 | }%
    \fi
    \ifnum 0<\bookmarkget{level}\relax
    \renewcommand*{\numberline}[1]{}%
    \fi
  }
}

\newcommand{\ALC@uniqueautorefname}{Line}
\newcommand{\algorithmautorefname}{Algorithm}

\@ifclasswith{report}{twoside}{%
  \newenvironment{rotatepage}{%
    \checkoddpage\ifoddpage
    \clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 270}%
    \else
    \clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 90}%
    \fi
  }%
  {\clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 0}}%
}{
  \newenvironment{rotatepage}%
  {\clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 90}}%
  {\clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 0}}%
}

\newcommand{\approvaldate}[1]{\gdef\@approvaldate{#1}}%
\newcommand{\@approvaldate}{\@latex@warning@no@line{No \noexpand\approvaldate given}}
\newcommand{\school}[1]{\gdef\@school{#1}}%
\newcommand{\@school}{\@latex@warning@no@line{No \noexpand\school given}}
\newcommand{\department}[1]{\gdef\@department{#1}}%
\newcommand{\@department}{\@latex@warning@no@line{No \noexpand\department given}}
\makeatother

\newenvironment{frontmatter}{%
  \clearpage
  \pagestyle{plain}
  \titleformat{\chapter}[display]{\normalfont\bfseries\filcenter}{\chaptertitlename\ \thechapter}{0pt}{\MakeUppercase{##1}}
}%
{%
}

\newenvironment{thesisbody}{%
  \clearpage
  \pagestyle{fancy}
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \titleformat{\chapter}[block]{\normalfont\bfseries\filcenter}{\MakeUppercase{CHAPTER \thechapter.}}{0.5em}{\MakeUppercase{##1}}
  \titlespacing*{\chapter}
  {0pt}{0pt}{30pt}
  \titleformat{\section}{\normalfont\bfseries}{\thesection}{1em}{##1}
  \titleformat{\subsection}{\normalfont\small\bfseries}{\thesubsection}{1em}{##1}
  \titleformat{\subsubsection}{\normalfont\small\bfseries}{\thesubsubsection}{1em}{##1}

  \setcounter{secnumdepth}{3}
  \setcounter{tocdepth}{3}
}%
{
  \clearpage
}

% ------------------ Title Page ------------------
\makeatletter
\newcommand{\makeTitlePage}[2]{
  \pagestyle{empty}
  \pagenumbering{roman}
  \currentpdfbookmark{Title Page}{titlePage}
  \phantomsection
  \begin{center}
    \bfseries
    \begin{singlespacing}
      \@title\\
      \vspace{6\baselineskip}

      A <Thesis or Capstone> by\\
      \vspace{6\baselineskip}

      \@author\\
      \vspace{7\baselineskip}

      Submitted to the Department of <Program Name>\\
      <College Name> (<College Acronym>)\\
      Caraga State University – Main Campus\\
      \vspace{6\baselineskip}

      In Partial Fulfillment\\
      of the Requirements for the Degree\\
      <Program Name> (<Program Acronym>)\\

      \vfill

      #1 #2 \\
      \vspace{0.5in}

    \end{singlespacing}
  \end{center}
}

% ------------------ Approval page environment/formatting ------------------
\newenvironment{approvalPage}
{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{APPROVAL SHEET}
  \begin{centering}
    \textbf{APPROVAL SHEET}\\
    \vspace{\baselineskip}
  \end{centering}
}
{
  \clearpage
}

% --- Dedication Environment ---
\newenvironment{dedication}
{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{DEDICATION}
  \begin{centering}
    \textbf{DEDICATION}\\
    \vspace{\baselineskip}
  \end{centering}
}
{
  \clearpage
}

% ------------------ Acknowledgment environment/formatting ------------------
\newenvironment{acknowledgment}
{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{ACKNOWLEDGMENT}
  \begin{centering}
    \textbf{ACKNOWLEDGMENT}\\
    \vspace{\baselineskip}
  \end{centering}
}
{
  \clearpage
}

% ------------------ abstract environment definition ------------------
\renewenvironment{abstract}
{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \begin{centering}
    \textbf{ABSTRACT}\\
    \vspace{\baselineskip}
  \end{centering}
}{
}

% --------------- table of contents formatting and command creation ---------------
\renewcommand{\cftsecdotsep}{10000}
\renewcommand{\cftsubsecdotsep}{10000}
\renewcommand{\cftsubsubsecdotsep}{10000}
\renewcommand{\cftfigdotsep}{10000}
\renewcommand{\cfttabdotsep}{10000}
\renewcommand{\cftchapfont}{\bfseries}
\renewcommand{\cftchappagefont}{}
\renewcommand{\cftchappresnum}{CHAPTER }
\renewcommand{\cftchapaftersnum}{:}
\renewcommand{\cftchapnumwidth}{6em}
\renewcommand{\cftchapafterpnum}{\vskip\baselineskip}
\renewcommand{\cftsecafterpnum}{\vskip\baselineskip}
\renewcommand{\cftsubsecafterpnum}{\vskip\baselineskip}
\renewcommand{\cftsubsubsecafterpnum}{\vskip\baselineskip}

\newcommand{\makeTOC}{
  \currentpdfbookmark{Table of Contents}{TOC}
  \renewcommand\contentsname{Table of Contents}
  \begin{singlespace}
    \setcounter{tocdepth}{3}
    \tableofcontents
  \end{singlespace}
  \clearpage
}

% ------------------ List of Tables ------------------
\newcommand{\makeListOfTables}{
  \phantomsection
  \addcontentsline{toc}{chapter}{LIST OF TABLES}
  \begin{singlespace}
    \setlength\cftbeforetabskip{\baselineskip}
    \listoftables
  \end{singlespace}
  \clearpage
}

% ------------------ List of Figures ------------------
\newcommand{\makeListOfFigures}{
  \phantomsection
  \addcontentsline{toc}{chapter}{LIST OF FIGURES}
  \begin{singlespace}
    \setlength\cftbeforefigskip{\baselineskip}
    \listoffigures
  \end{singlespace}
  \clearpage
}

% ------------------ List of Acronyms ------------------
\newcommand{\makeListOfAcronyms}{
  \phantomsection
  \addcontentsline{toc}{chapter}{LIST OF ACRONYMS}
  \printglossary[type=\acronymtype,title=LIST OF ACRONYMS]
}

% ------------------ appendix environment definition ------------------
\makeatletter
\newenvironment{theappendices}{
  \bookmarksetup{depth=0,open}
  \addtocontents{toc}{\setcounter{tocdepth}{1}}
  \renewcommand{\addappheadtotoc}{%
    \phantomsection
    \addcontentsline{toc}{chapter}{\MakeUppercase{\appendixpagename}}%
  }
  \renewcommand{\@chap@pppage}{%
    \clear@ppage
    \addappheadtotoc
    \thispagestyle{empty}%
    \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
    \null\vfil
    \markboth{}{}%
    {\centering
      \interlinepenalty \@M
      \normalfont
    \Huge \bfseries \MakeUppercase{\appendixpagename}\par}%
    \if@dotoc@pp
    \fi
  }
  \bookmarksetupnext{level=part}
  \begin{appendices}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecpresnum}{\appendixname\space}}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecnumwidth}{5.75em}}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftsecaftersnum}{:}}
    \addtocontents{toc}{%
      \begingroup
      \let\protect\l@chapter\protect\l@section
      \let\protect\l@section\protect\l@subsection
    }
  }{
    \addtocontents{toc}{\endgroup}
  \end{appendices}
}
\makeatother

% ------------------ bibliography formatting and command creation ------------------
\AtEveryBibitem{\clearfield{issn}}
\AtEveryBibitem{\clearlist{issn}}
\AtEveryBibitem{\clearfield{language}}
\AtEveryBibitem{\clearlist{language}}
\AtEveryBibitem{\clearfield{url}}
\AtEveryBibitem{\clearlist{url}}
\AtEveryBibitem{%
  \ifentrytype{online}{}
{\clearfield{urlyear}\clearfield{urlmonth}\clearfield{urlday}}}

\newcommand{\makeBibliography}{
  \clearpage
  \bookmarksetupnext{level=part}
  \phantomsection
  \addcontentsline{toc}{chapter}{REFERENCES}
  \begin{centering}
    \textbf{REFERENCES}\\
  \end{centering}
  \begin{singlespace}
    \setlength\bibitemsep{\baselineskip}
    \printbibliography[heading=none]
  \end{singlespace}
}

% --- Bionote Environment ---
\newenvironment{bionote}
{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{BIONOTE}
  \begin{centering}
    \textbf{BIONOTE}\\
    \vspace{\baselineskip}
  \end{centering}
}
{
  \clearpage
}
