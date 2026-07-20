% Seb CV - compact, readable, single-page class
\ProvidesClass{seb-cv}[2025/11/03 Compact readable CV]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\cv@print{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\RequirePackage[lmargin=0.9cm, rmargin=0.9cm, tmargin=0.4cm, bmargin=0.4cm]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{enumitem}
\RequirePackage[document]{ragged2e}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{titlesec}
\RequirePackage{fontspec}
\RequirePackage{fontawesome5}

% Colors
\definecolor{title}{HTML}{14529e}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

% Fonts
\newcommand*{\cv@interpath}{fonts/inter/}
\newcommand*{\cv@monopath}{fonts/officecodeprod/}
\newcommand*{\cv@font@light}{Inter-Light.ttf}
\newcommand*{\cv@font@semibold}{Inter-SemiBold.ttf}
\newcommand*{\cv@font@mono}{OfficeCodeProD-Light.ttf}
\newcommand*{\cv@font@body}{\cv@font@light}
\newcommand*{\cv@font@bold}{\cv@font@semibold}
\newcommand*{\cv@font@title}{\cv@font@semibold}
\newcommand*{\cv@font@titlelight}{\cv@font@light}
\newcommand*{\cv@font@descriptor}{\cv@font@light}
\newcommand*{\cv@font@location}{\cv@font@semibold}
\newcommand*{\cv@bodyfontsize}{9.5}
\newcommand*{\cv@subheadingsize}{11.5}
\newcommand*{\cv@descriptorsize}{10}
\newcommand*{\cv@locationsize}{8pt}

\setmainfont[
  Color=primary,
  Path=\cv@interpath,
  BoldFont=\cv@font@bold,
  ItalicFont=\cv@font@body,
  BoldItalicFont=\cv@font@bold,
  ItalicFeatures={FakeSlant=0.22},
  BoldItalicFeatures={FakeSlant=0.22}
]{\cv@font@body}

\setsansfont[
  Scale=MatchLowercase,
  Path=\cv@interpath,
  BoldFont=\cv@font@bold,
  ItalicFont=\cv@font@body,
  BoldItalicFont=\cv@font@bold,
  ItalicFeatures={FakeSlant=0.22},
  BoldItalicFeatures={FakeSlant=0.22}
]{\cv@font@body}

% Header
\newcommand{\namesection}[4]{%
  \begin{center}
    \color{title}
    \fontsize{40pt}{40pt}%
    \fontspec[Path=\cv@interpath]{\cv@font@title}\selectfont #1
    \ \fontspec[Path=\cv@interpath]{\cv@font@titlelight}\selectfont #2
    \\[5pt]
    \fontspec[Path=\cv@monopath]{\cv@font@mono}\fontsize{13pt}{15pt}\selectfont #3
    \\[5pt]
    \fontspec[Path=\cv@monopath]{\cv@font@mono}\fontsize{9.8pt}{11pt}\selectfont #4
  \end{center}
}

% Section headings
\titlespacing{\section}{0pt}{4pt}{3pt}
\titlespacing{\subsection}{0pt}{2pt}{1pt}
\newcommand{\sectionsep}{\vspace{4pt}}
\newcommand{\entrysep}{\vspace{3pt}}
\newcommand{\headerbar}{%
  \vspace*{-10pt}
  \par\noindent\textcolor{title}{\rule{\textwidth}{1pt}}%
}

\titleformat{\section}{\color{title}
  \fontspec[Path=\cv@interpath,BoldFont=\cv@font@title]{\cv@font@title}\fontsize{15pt}{19pt}\selectfont\raggedright}{}{0em}{\MakeUppercase}

\titleformat{\subsection}{
  \color{subheadings}\fontspec[Path=\cv@interpath,BoldFont=\cv@font@title]{\cv@font@title}\fontsize{\cv@subheadingsize}{13pt}\selectfont\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{%
\raggedright\color{subheadings}\fontspec[Path=\cv@interpath,BoldFont=\cv@font@title]{\cv@font@title}\fontsize{\cv@subheadingsize}{13pt}\selectfont\uppercase{#1}\normalfont\par
}

\newcommand{\descript}[1]{%
\vspace{1pt}
\color{subheadings}\raggedright\fontspec[Path=\cv@interpath,BoldFont=\cv@font@bold]{\cv@font@descriptor}\fontsize{\cv@descriptorsize}{12pt}\selectfont{#1\\}\normalfont
}

\newcommand{\location}[1]{%
\vspace{2pt}
\color{headings}\raggedright\fontspec[Path=\cv@interpath,BoldFont=\cv@font@location]{\cv@font@location}\fontsize{\cv@locationsize}{10pt}\selectfont{#1\\}\normalfont
\vspace{2pt}
}

% Contact line
\newcommand{\contactline}[4]{%
    \faGithub\ \, #1 \quad
    \faLinkedin\ \, #2 \quad
    \faEnvelope\ \, #3 \quad
    \faPhone\ \, #4
}

% Lists
\newenvironment{tightemize}{
  \begin{itemize}[leftmargin=*,label=\textbullet,itemsep=1.4pt,topsep=1.4pt,parsep=0pt,partopsep=0pt,labelsep=0.55em]
  \setlength{\baselineskip}{12pt}
}{
  \end{itemize}
}

\setlength{\footskip}{6pt}
\setlength{\textheight}{\dimexpr\textheight+36pt\relax}

\endinput
