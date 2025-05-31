% !TeX root = thesis.tex
% !TeX program = xelatex  % Or lualatex

\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt]{report}

% --- Package Imports ---
\RequirePackage{graphicx}
\RequirePackage[letterpaper, left=1.5in, right=1in, top=1in, bottom=1in]{geometry}
\RequirePackage{multicol}
\RequirePackage{setspace}
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
\captionsetup[table]{skip=0pt}
\RequirePackage{subcaption}
\RequirePackage[acronym,nogroupskip,nopostdot]{glossaries}
\RequirePackage{doi}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}

\newcommand{\thesistitlefontsize}{\fontsize{14pt}{16.8pt}\selectfont}
\newcommand{\sectiontitlefontsize}{\fontsize{13pt}{15.6pt}\selectfont}
\newcommand{\rothead}[1]{\rotatebox{90}{\textbf{#1}}}

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
  \fancyhead[R]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% --- Spacing and Paragraph Setup ---
\doublespacing
\setlength{\parindent}{3.011em}

% --- Document-wide Settings ---
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

% --- Default Chapter Title Formatting & Spacing ---
\titleformat{\chapter}[display]
{\thesistitlefontsize\bfseries\filcenter}
{\chaptertitlename\ \thechapter}
{0pt}
{\MakeUppercase}
\titlespacing*{\chapter}
{0pt}{-\topskip}{35pt}

%%% Section, Subsection, Subsubsection title formats
\titleformat{\section}{\sectiontitlefontsize\bfseries}{\thesection}{1em}{##1}
\titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{1em}{##1}
\titleformat{\subsubsection}{\normalfont\bfseries}{\thesubsubsection}{1em}{##1}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\makeatletter

% --- Bookmark Formatting ---
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

% --- Autoref Names ---
\newcommand{\ALC@uniqueautorefname}{Line}
\newcommand{\algorithmautorefname}{Algorithm}

% --- Rotatepage Environment ---
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

% --- Thesis Information Tokens ---
\newcommand{\approvaldate}[1]{\gdef\@approvaldate{#1}}%
\newcommand{\@approvaldate}{\@latex@warning@no@line{No \noexpand\approvaldate given}}
\newcommand{\school}[1]{\gdef\@school{#1}}%
\newcommand{\@school}{\@latex@warning@no@line{No \noexpand\school given}}
\newcommand{\department}[1]{\gdef\@department{#1}}%
\newcommand{\@department}{\@latex@warning@no@line{No \noexpand\department given}}
\makeatother

% --- Frontmatter Environment ---
% Handles title formatting for ToC, LoF, LoT (which use \chapter*)
\newenvironment{frontmatter}{%
  \clearpage
  \pagestyle{plain}
  \titleformat{\chapter}[display]
  {\vspace*{-16.8pt}\normalfont\thesistitlefontsize\bfseries\filcenter}
  {}
  {0pt}
  {\MakeUppercase{##1}}
  \titlespacing*{\chapter}
  {0pt}{0pt}{35pt}
}%
{%
}

% --- Thesisbody Environment ---
\newenvironment{thesisbody}{%
  \clearpage
  \pagestyle{fancy}
  \pagenumbering{arabic}
  \setcounter{page}{1}

  \titleformat{\chapter}[block]
  {\vspace*{-28pt}\thesistitlefontsize\bfseries\filcenter}
  {\MakeUppercase{CHAPTER \thechapter.}}
  {0.5em}
  {\MakeUppercase{##1}}[\thispagestyle{empty}]
  \titlespacing*{\chapter}
  {0pt}{0pt}{35pt}

  \titleformat{\section}{\sectiontitlefontsize\bfseries}{\thesection}{1em}{##1}
  \titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{1em}{##1}
  \titleformat{\subsubsection}{\normalfont\bfseries}{\thesubsubsection}{1em}{##1}
}%
{
  \clearpage
}

% --- Title Page Command ---
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

      A Thesis by\\
      \vspace{6\baselineskip}

      \@author\\
      \vspace{7\baselineskip}

      Submitted to the Department of Bachelor of Science in Computer Science\\
      College of Computing and Information Sciences (CCIS)\\
      Caraga State University – Main Campus\\
      \vspace{6\baselineskip}

      In Partial Fulfillment\\
      of the Requirements for the Degree\\
      Bachelor of Science in Computer Science (BSCS)\\

      \vfill
      \vspace{2cm}

      #1 #2 \\
      \vspace{0.25cm}

    \end{singlespacing}
  \end{center}
}
\makeatother

% --- Approval Page Environment ---
\newenvironment{approvalPage}
{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{APPROVAL SHEET}
  \begin{centering}
    \thesistitlefontsize\textbf{APPROVAL SHEET}\\
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
    \thesistitlefontsize\textbf{DEDICATION}\\
    \vspace{\baselineskip}
  \end{centering}
}
{
  \clearpage
}

% --- Acknowledgment Environment ---
\newenvironment{acknowledgment}
{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{ACKNOWLEDGMENT}
  \begin{centering}
    \thesistitlefontsize\textbf{ACKNOWLEDGMENT}\\
    \vspace{\baselineskip}
  \end{centering}
}
{
  \clearpage
}

% --- Abstract Environment ---
\renewenvironment{abstract}
{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \begin{centering}
    \thesistitlefontsize\textbf{ABSTRACT}\\
    \vspace{\baselineskip}
  \end{centering}
}{
}

% --- Table of Contents Title ---
\renewcommand{\contentsname}{TABLE OF CONTENTS}

% --- Table of Contents Formatting and Command Creation ---
\renewcommand{\cftchapdotsep}{\cftdotsep}
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
  \begin{singlespace}
    \setcounter{tocdepth}{3}
    \tableofcontents
  \end{singlespace}
  \clearpage
}

% --- List of Tables Command ---
\newcommand{\makeListOfTables}{
  \phantomsection
  \begin{singlespace}
    \setlength\cftbeforetabskip{\baselineskip}
    \listoftables
  \end{singlespace}
  \clearpage
}

% --- List of Figures Command ---
\newcommand{\makeListOfFigures}{
  \phantomsection
  \begin{singlespace}
    \setlength\cftbeforefigskip{\baselineskip}
    \listoffigures
  \end{singlespace}
  \clearpage
}

% --- List of Acronyms Command ---
\newcommand{\makeListOfAcronyms}{
  \phantomsection
  \printglossary[type=\acronymtype,title=LIST OF ACRONYMS]
  \clearpage
}

% --- Appendix Environment Definition ---
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
    \thesistitlefontsize\bfseries \MakeUppercase{\appendixpagename}\par}
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

\AtEveryBibitem{\clearfield{issn}}
\AtEveryBibitem{\clearlist{issn}}
\AtEveryBibitem{\clearfield{language}}
\AtEveryBibitem{\clearlist{language}}
\AtEveryBibitem{\clearfield{url}}
\AtEveryBibitem{\clearlist{url}}
\AtEveryBibitem{%
  \ifentrytype{online}{}{%
    \clearfield{urlyear}\clearfield{urlmonth}\clearfield{urlday}%
  }%
}

\newcommand{\makeBibliography}{
  \clearpage
  \bookmarksetupnext{level=part}
  \phantomsection
  \addcontentsline{toc}{chapter}{REFERENCES}
  \begin{centering}
    \thesistitlefontsize\textbf{REFERENCES}\\
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
  \thispagestyle{empty}
  \phantomsection
  \addcontentsline{toc}{chapter}{BIONOTE}
  \begin{centering}
    \thesistitlefontsize\textbf{BIONOTE}\\
    \vspace{\baselineskip}
  \end{centering}
}
{
  \clearpage
}