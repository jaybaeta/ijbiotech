%
%   LaTeX class file for IJBiotech
%   Copyright (C) 2018 Joaquim Baeta <mail@joaquimbaeta.com>
%
%   This program is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <https://www.gnu.org/licenses/>.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{base/ijb}[2018/11/11, version 2.1]
\AtEndOfClass{\RequirePackage{microtype}} % For better typography

% Options for element switching
\RequirePackage{xifthen} % For if arguments
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*

\LoadClass{extarticle} % Support more font sizes

% Display line numbers; must comment this out for flushend to work
\RequirePackage[switch]{lineno} 
\linenumberfont{\normalfont\footnotesize\sffamily}

% Choose article type
\newcommand*{\articletype}[1]{%
	\RequirePackage{styles/#1}}

% Article structure
\RequirePackage[left=20mm,%
                right=20mm,%
                top=25mm,%
                bottom=25mm,%
                headheight=5mm,%
                headsep=6mm,%
                a4paper]{geometry}%
	\setlength{\columnsep}{24pt} % Distance between columns
\RequirePackage{flushend}

% Paragraph structure
	\edef\restoreparindent{\parindent=\the\parindent\relax} % Maintain indents when using parskip package
\RequirePackage{parskip}
	\setlength{\parskip}{0pt plus 0.5pt minus 0pt} % Maintain spaces between paragraphs
	\restoreparindent % Restore indents when using parskip package
	\setlength{\parindent}{16pt} % Indent length
\RequirePackage{enumitem} 
	\setlist[itemize]{noitemsep} % Remove separation between list items
	\setlist[enumerate]{noitemsep} % Remove separation between list items

% Language and fonts
\RequirePackage[english]{babel} % Typographic support for different languages 
\RequirePackage{amsmath,amsfonts,amssymb} % Equations
\RequirePackage{mathpazo} % Equations
\RequirePackage[T1]{fontenc}
\RequirePackage{url} % For urls
\RequirePackage{hyperxmp} % PDF metadata
\RequirePackage[pdfusetitle,%
				colorlinks=true,%
				allcolors=ijbblue]{hyperref} % For links; includes colours of links
	\hypersetup{%
		pdfcopyright={Copyright © \the\year{} THE AUTHORS. Published under a Creative Commons Attribution-ShareAlike 4.0 International license.}, % Copyright
		pdflicenseurl={https://creativecommons.org/licenses/by-sa/4.0/} % Link to license
	}   
\RequirePackage{lettrine}
\RequirePackage{fontspec}
	\setmainfont[ % Main (serif) font
        Path = base/fonts/,
        Extension = .ttf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{Tinos}
	\setsansfont[ % Sans serif font
        Path = base/fonts/,
        Extension = .ttf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{Lato}

%	Font styles
    \newfontfamily\journalnamefont{Gentium Book Basic} % Font of the journal title
	\newcommand{\journalname}{\journalnamefont\fontsize{21}{23}\selectfont}
	\newcommand{\titlefont}{\normalfont\sffamily\bfseries\fontsize{15}{18}\selectfont} % Article title
	\newcommand{\genesisfont}{\color{black}\normalfont\sffamily\fontsize{7}{9}\selectfont} % Dates the article was submitted, revised, and accepted
	\newcommand{\absfont}{\normalfont\sffamily\linespread{1.1}\fontsize{9}{11}\selectfont} % Abstract
	\newcommand{\keywordsfont}{\normalfont\sffamily\linespread{1.2}\fontsize{8}{10}\selectfont} % Keywords
	\newcommand{\headerfont}{\normalfont\sffamily\fontsize{9}{11}\selectfont} % Headers
    \newcommand{\noitalic}{\normalfont\bfseries\sffamily} % Remove italics on specific words in section titles
\RequirePackage{authblk} % Authors and affiliations
	\setlength{\affilsep}{6pt} % Spacing between list of authors and affiliations
	\renewcommand\Authfont{\color{black}\normalfont\sffamily\bfseries\fontsize{9}{13}\selectfont} % Authors
	\renewcommand\Affilfont{\color{black}\normalfont\sffamily\fontsize{8}{10}\selectfont} % Affiliations
	\makeatletter
	\renewcommand\AB@affilsepx{\\ \protect\Affilfont}
	\renewcommand\AB@authnote[1]{\textsuperscript{\mdseries\upshape#1}}
	\renewcommand\AB@affilnote[1]{\textsuperscript{\upshape#1}}
	\makeatother
	\renewcommand\Authands{, and } % Remove comma when there are only two authors
\RequirePackage{textcomp} % Symbols
\RequirePackage{gensymb} % For the \degree, \celsius, \perthousand, \micro, and \ohm commands
\RequirePackage{datetime} % Dates
	\newdateformat{monthyeardate}{%
		\monthname[\THEMONTH] \THEYEAR}

% Graphics, tables, and figures
\RequirePackage{graphicx,xcolor}
%	Colours
	\definecolor{grey}{gray}{0.5} % 50% black
	\definecolor{black}{RGB}{0,0,0} % Base colour
	\definecolor{ijbblue}{HTML}{31496C} % IJBiotech blue
\RequirePackage{colortbl} % Enable changing colours of tables
\RequirePackage[font={sf,footnotesize},%
                labelfont={bf},%
                labelsep=space,%
                figurename=FIGURE,%
                tablename=TABLE,%
                singlelinecheck=off,]{caption} % Captions
\RequirePackage{subcaption}
\RequirePackage{tabularx}
% 	Table style
	\newenvironment{tableminipage}[1]{\begin{minipage}{#1}\renewcommand  \footnoterule{ \kern -1ex}}{\end{minipage}}
	\arrayrulecolor{black} % Colour of horizontal rules
	\renewcommand{\arraystretch}{1.5} % Increased line spacing
	\captionsetup[table]{position=below} % Reduce spacing below caption
\RequirePackage{booktabs}
\RequirePackage{tikz}
	\usetikzlibrary{calc}
\RequirePackage{changepage}
\RequirePackage{afterpage} % Prevent content ending abruptly when page is cleared
\RequirePackage{rotating} % For sideways tables and figures
\RequirePackage{stfloats} % Improve figure placement in two column environment
\RequirePackage[absolute,overlay]{textpos} % Enable absolute positioning of figures
	\setlength{\TPHorizModule}{1mm}
	\setlength{\TPVertModule}{1mm}
	\textblockorigin{0mm}{0mm} % Start everything near the top-left corner

% Headers and footers
\RequirePackage{fancyhdr} % custom headers/footers
    \pagestyle{fancy} % Enable the custom headers/footers
% 	Header style
	\fancyhead[L]{\headerfont{\authorheader}} % Authors
	\fancyhead[R]{\headerfont{\textit{Indonesian Journal of Biotechnology}} \articleno} % Name of journal
    \renewcommand{\headrulewidth}{0.5pt} % Width of header line 
% 	Footer style
	\lfoot{}
	\cfoot{}
	\rfoot{}
	\makeatletter
	\fancyfoot[C]{\headerfont\thepage\ } % Page number
	\makeatother
	\fancyfoot[R]{}
	\renewcommand{\footrulewidth}{0pt} % No footer line
%	Enable editing of article information in main.tex
	\newcommand{\articleno}[1]{\def\articleno{#1}} % Volume number (etc.)
    \newcommand{\authorheader}[1]{\def\authorheader{#1}} % Author(s)
	\newcommand{\doifooter}[1]{\def\doifooter{#1}} % DOI
\RequirePackage{lastpage} % Page numbers

% DOI
\RequirePackage{doi}

% References
\RequirePackage[round]{natbib} 
	\bibpunct{(}{)}{;}{author-year}{}{,}
	\bibliographystyle{base/cse}
	\addto{\captionsenglish}{\renewcommand{\refname}{References}}
	\setlength{\bibsep}{0pt plus 0.5pt minus 0pt}
	\setlength{\bibhang}{16pt}
	\setcitestyle{aysep={}}

% Sectioning 
	\setcounter{secnumdepth}{3} % Sections, subsections, and subsubsections are numbered
	\setcounter{tocdepth}{3} % If table of contents is shown, both sections and subsections will be listed
\RequirePackage[explicit]{titlesec} % Better handling of section titles
	\titleformat{\section} % Formatting of section titles
		{\large\sffamily\bfseries}
		{\thesection.}
		{0.5em}
		{#1}
		[]
	\titleformat{name=\section,numberless}
		{\large\sffamily\bfseries}
		{}
		{0em}
		{#1}
		[]
	\titleformat{\subsection} % Formatting of subsection titles
		{\sffamily\bfseries\itshape}
		{\thesubsection.}
		{0.5em}
		{#1}
		[]
	\titleformat{\subsubsection} % Formatting of subsubsection titles
		{\sffamily\itshape}
		{\thesubsubsection.}
		{0.5em}
		{#1}
		[]
	\titleformat{\paragraph}[runin] % Formatting of paragraph titles
		{\sffamily\small\bfseries}
		{}
		{0em}
		{#1}
	\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt} % Spacing of section titles
	\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt} % Spacing of subsection titles
	\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt} % Spacing of subsubsection titles
	\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt} % Spacing of paragraph titles

% Content of first page of articles
% 	Journal title
	\fancypagestyle{firststyle}{%
        \renewcommand{\headrulewidth}{0pt} % No header line 
        \fancyhead[L]{%
            \begin{tikzpicture}[overlay, remember picture]%
                \fill[ijbblue] (current page.north west) rectangle ($(current page.north east)+(0,-0.9in)$);
                \node[anchor=north east,
                	  text=white, 
                      font=\huge, 
                      minimum size=1.15in, 
                      inner xsep=42.5mm
                      ] at (current page.north east) {\journalname\textit{Indonesian Journal of Biotechnology}};
                \node[anchor=north east, 
                	  minimum size=1.215in, 
                      inner xsep=20mm,
                      inner ysep=-1mm,
                      ] at (current page.north east) {\includegraphics[width=15.5mm]{base/logo-white-blue}};
                \node[anchor=north east, 
                	  text=ijbblue, 
                      font=\headerfont, 
                      minimum size=1in, 
                      inner xsep=42.5mm, 
                      inner ysep=25mm
                      ] at (current page.north east) {VOLUME \articleno \quad|\quad RESEARCH ARTICLE};
            \end{tikzpicture}
        }%
        \fancyhead[R]{}
        \fancyfoot[L]{
            \begin{minipage}{0.47\linewidth}%
                \scriptsize\sffamily{%
                    \vspace{0.4mm} \textit{Indones J Biotechnol} \articleno \enspace|\enspace \textbf{DOI} \doifooter \\ 					\href{https://jurnal.ugm.ac.id/ijbiotech}{www.jurnal.ugm.ac.id/ijbiotech}
                }
            \end{minipage}
        }
        \fancyfoot[C]{}
        \fancyfoot[R]{%
            \begin{minipage}{0.47\linewidth}%
                \scriptsize\sffamily Copyright \copyright \hspace{1pt} \the\year{} THE AUTHOR(S). This article is distributed under a \href{https://creativecommons.org/licenses/by-sa/4.0/}{\mbox{Creative} Commons Attribution-ShareAlike 4.0 International} license.
            \end{minipage}
        }
        \renewcommand{\footrulewidth}{0.5pt} % Width of header line
    }

%	Set up article genesis
	\newcommand{\submitted}[1]{\def\@submitted{#1}} % Date article was submitted
	\newcommand{\submittedname}{SUBMITTED}%
	\newcommand{\revised}[1]{\def\@revised{#1}} % Date article was revised
	\newcommand{\revisedname}{REVISED}%
	\newcommand{\accepted}[1]{\def\@accepted{#1}} % Date article was accepted
	\newcommand{\acceptedname}{ACCEPTED}%
%	Set up abstract
	\def\xabstract{abstract}
	\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract
	\long\gdef\theabstract{\ignorespaces#1}
	\def\go{\end{abstract}}\else
	\gdef\theabstract{}\let\go\relax\fi
	\go}
%	Set up keywords
	\newcommand{\keywords}[1]{\def\@keywords{#1}}
	\newcommand{\keywordname}{KEYWORDS} % Defines the keywords heading name
%	Set up abstract environment
    \newcommand{\abscontent}{%
        \noindent
        {%
            \parbox{\dimexpr\linewidth}{%
                {\absfont\bfseries ABSTRACT}\hspace{1mm}\absfont \theabstract
            }%
            \vskip10pt%
            \noindent
            \parbox{\dimexpr\linewidth-2\fboxsep\relax}{%
                {\keywordsfont\bfseries\keywordname}\hspace{1mm}\keywordsfont \@keywords%
            }%
        }%
    }%

% 	Title, authors, affiliations, genesis, abstract, and keywords
	\renewcommand{\@maketitle}{\bgroup\setlength{\parindent}{0pt}
	\begin{flushleft}
    {%
		\vskip62pt % Optimally 62pt
		{\titlefont \@title\par} % Title
		\vskip16pt % Optimally 16pt
		{\@author\par} % Author(s)
		\vskip10pt % Optimally 10pt
        {\genesisfont\bfseries\submittedname}\hspace{1mm}\genesisfont\@submitted\quad{\genesisfont\bfseries\revisedname}\hspace{1mm}\genesisfont\@revised\quad{\genesisfont\bfseries\acceptedname}\hspace{1mm}\genesisfont\@accepted%
		\vskip16pt % Optimally 16pt 
	}% 
	\end{flushleft}\egroup
	{\color{ijbblue}\rule{\linewidth}{0.5pt}} % Line above abstract content
	{%
		\vskip10pt % Optimally 10pt
		\abscontent % Abstract and keywords
        \vskip26pt % Optimally 26pt
	}%
}