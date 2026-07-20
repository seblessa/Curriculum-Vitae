\ProvidesClass{cv}[2026/07/20 One-page CV template]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[a4paper]{article}

\RequirePackage[lmargin=0.9cm, rmargin=0.9cm, tmargin=0.4cm, bmargin=0.4cm]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{enumitem}
\RequirePackage[document]{ragged2e}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{titlesec}
\RequirePackage{fontspec}
\RequirePackage{fontawesome5}

\definecolor{title}{HTML}{14529E}
\definecolor{primary}{HTML}{2B2B2B}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

\newcommand*{\cv@fontpath}{fonts/inter/}
\newcommand*{\cv@font@light}{Inter-Light.ttf}
\newcommand*{\cv@font@semibold}{Inter-SemiBold.ttf}

\setmainfont[
  Path=\cv@fontpath,
  BoldFont=\cv@font@semibold,
  ItalicFont=\cv@font@light,
  BoldItalicFont=\cv@font@semibold,
  ItalicFeatures={FakeSlant=0.22},
  BoldItalicFeatures={FakeSlant=0.22}
]{\cv@font@light}

\setsansfont[
  Scale=MatchLowercase,
  Path=\cv@fontpath,
  BoldFont=\cv@font@semibold,
  ItalicFont=\cv@font@light,
  BoldItalicFont=\cv@font@semibold,
  ItalicFeatures={FakeSlant=0.22},
  BoldItalicFeatures={FakeSlant=0.22}
]{\cv@font@light}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\AtBeginDocument{\color{primary}}

\newcommand{\namesection}[4]{%
  \begin{center}
    \color{title}
    \fontsize{40pt}{40pt}\bfseries #1
    \ \mdseries #2
    \\[5pt]
    \mdseries\fontsize{13pt}{15pt}\selectfont #3
    \\[5pt]
    \fontsize{9.5pt}{11pt}\selectfont #4
  \end{center}
}

\titlespacing{\section}{0pt}{7pt}{4pt}
\titlespacing{\subsection}{0pt}{3pt}{2pt}
\newcommand{\sectionsep}{\vspace{7pt}}
\newcommand{\entrysep}{\vspace{5pt}}
\newcommand{\headerbar}{%
  \vspace*{-10pt}
  \par\noindent\textcolor{title}{\rule{\textwidth}{1pt}}%
}

\titleformat{\section}{
  \color{title}\bfseries\fontsize{15pt}{19pt}\selectfont\raggedright
}{}{0em}{\MakeUppercase}

\titleformat{\subsection}{
  \color{subheadings}\bfseries\fontsize{11.5pt}{13pt}\selectfont\uppercase
}{}{0em}{}

\newcommand{\runsubsection}[1]{%
  \raggedright\color{subheadings}\bfseries\fontsize{11.5pt}{13pt}\selectfont
  \uppercase{#1}\normalfont\par
}

\newcommand{\descript}[1]{%
  \vspace{1pt}
  \color{subheadings}\raggedright\mdseries\fontsize{10pt}{12pt}\selectfont
  {#1\\}\normalfont
}

\newcommand{\location}[1]{%
  \vspace{2pt}
  \color{headings}\raggedright\bfseries\fontsize{8pt}{10pt}\selectfont
  {#1\\}\normalfont
  \vspace{2pt}
}

\newcommand{\contactline}[4]{%
  \faGithub\ \, #1 \quad
  \faLinkedin\ \, #2 \quad
  \faEnvelope\ \, #3 \quad
  \faPhone\ \, #4
}

\newenvironment{tightemize}{
  \begin{itemize}[leftmargin=*,label=\textbullet,itemsep=1.8pt,topsep=2pt,parsep=0pt,partopsep=0pt,labelsep=0.55em]
  \setlength{\baselineskip}{12.3pt}
}{
  \end{itemize}
}

\setlength{\footskip}{6pt}
\setlength{\textheight}{\dimexpr\textheight+36pt\relax}

\endinput
