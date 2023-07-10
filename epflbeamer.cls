% Template for EPFL presentations with LaTeX beamer.

% Titouan Renard, titouan.renard@gmail.com

% Inspired by the template for LUT by Aleksei Mashlakov,
% itself inspired by the template for SINTEF by Federico Zenith,
% which was derived (through several iterations) from Håvard Berland's
% beamerthementnu class.

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.

% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

\ProvidesClass{epflbeamer}[2022/08/10]

\RequirePackage{etoolbox}

\usepackage{xcolor}
% Contrast colours
\definecolor{epflrouge}{HTML}{FE0000} % Color for cover title
\definecolor{epflgroseille}{HTML}{B51F1F} 
\definecolor{epflleman}{HTML}{00A79F}
\definecolor{epflcanard}{HTML}{007480}
\definecolor{epflardoise}{HTML}{413D3A}
\definecolor{epflperle}{HTML}{CAC7C7}
\definecolor{black}{rgb}{0.0, 0.0, 0.0}
\definecolor{white}{rgb}{1.0, 1.0, 1.0}

\newcommand{\@DashColor}{epflrouge}
\newcommand{\@DashHeight}{1mm}
\newcommand*{\coverimage}[1]{\def\@coverimage{#1}}

\newcommand{\testcolor}[1]{\colorbox{#1}{\textcolor{#1}{test}} \texttt{#1}}
\newcommand{\hrefcol}[2]{\textcolor{epflrouge}{\href{#1}{#2}}}


\newbool{IsDark}
\PassOptionsToClass{aspectratio=169}{beamer} % Default, may be overridden
\DeclareOption{cyandash}{\renewcommand{\@DashColor}{epflrouge}}
\DeclareOption{nodash}{\renewcommand{\@DashHeight}{0mm}}
\DeclareOption{light}{\boolfalse{IsDark}}
\DeclareOption{dark}{\booltrue{IsDark}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

\usepackage{caladea,carlito}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{graphicx,ifthen}

% Following commands will not be activated for article mode.
\mode<presentation>

% No navigation symbols
\setbeamertemplate{navigation symbols}{}

% phantom items 
\setbeamercovered{transparent} % invisible

% nomenclature
\usepackage[symbols,nomain,acronyms,makeindex,section=subsection]{glossaries-extra}
\newglossary{latin}{lat}{latout}{Latin alphabet}
\newglossary{greek}{grk}{grkout}{Greek alphabet}
\newglossary{sub}{sub}{subout}{Subscripts}
\newglossary{sup}{sup}{supout}{Superscripts}
\newglossary{dimless}{diml}{dimlout}{Dimensionless numbers}
\newglossary{notation}{not}{notout}{Notation}
\glsnoexpandfields
\glstocfalse
% \makeglossaries
\input{nomenclature.tex}

% packages
\usepackage{amsfonts,amsmath,oldgerm}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\minimize}{minimize} % minimize operator
\usepackage[T1]{fontenc}
\usepackage{fontspec} % Advanced font selection
\usepackage{graphicx}
\usepackage{subfig}
\usepackage{tikz}
\usepackage{verbatim}

%% If XeLaTeX or LuaLaTeX is set as the compiler, the EPFL house style fonts are used


% Use SuisseIntl as the main font
\newfontfamily\suisseintl{SuisseIntl}
    [Path=ressources/epfl/fonts/suisse-intl/,
    Extension=.ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-RegularItalic,
    BoldItalicFont=*-BoldItalic]

%% Adding SuisseIntl as the main font and supplementary fonts
\setmainfont{SuisseIntl}
[Path=ressources/epfl/fonts/suisse-intl/,
    Extension=.ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-RegularItalic,
    BoldItalicFont=*-BoldItalic]
\setmathsf{SuisseIntl}
[Path=ressources/epfl/fonts/suisse-intl/,
    Extension=.ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-RegularItalic,
    BoldItalicFont=*-BoldItalic]
\setmathtt{SuisseIntl}
[Path=ressources/epfl/fonts/suisse-intl/,
    Extension=.ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-RegularItalic,
    BoldItalicFont=*-BoldItalic]
\setsansfont{SuisseIntl}
[Path=ressources/epfl/fonts/suisse-intl/,
    Extension=.ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-RegularItalic,
    BoldItalicFont=*-BoldItalic]
\setmonofont{SuisseIntlMono}
[Path=ressources/epfl/fonts/suisse-intl-mono/,
    Scale=0.9,
    LetterSpace=-6,
    Extension=.ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold]

\newfontfamily\titlestyle[Path=ressources/epfl/fonts/suisse-intl/]{SuisseIntl-Bold.ttf}
\newfontfamily\largetitlestyle[Path=ressources/epfl/fonts/suisse-intl/]{SuisseIntl-SemiBold.ttf}
\newfontfamily\subtitlestyle[Path=ressources/epfl/fonts/suisse-intl/]{SuisseIntl-Thin.ttf}
\newfontfamily\subjectstyle[Path=ressources/epfl/fonts/suisse-intl/]{SuisseIntl-Regular.ttf}
\newfontfamily\quotefont[Path=ressources/epfl/fonts/suisse-intl-mono/]{SuisseIntlMono-Regular.ttf}

%% Changing the quote environment to use SuissIntlMono
\AtBeginEnvironment{quote}{\quotefont}


% line spacing
\linespread{1.1}\selectfont % <---

% item spacing
% \let\tempone\itemize
% \let\temptwo\enditemize
% \renewenvironment{itemize}{\tempone\addtolength{\itemsep}{0.35\baselineskip}}{\temptwo}

% bibliography style
\usepackage[style=numeric,backend=bibtex]{biblatex}
% \usepackage[autocite=footnote,style=authortitle,backend=bibtex]{biblatex} 
\addbibresource{references.bib}

% Set colours
\setbeamercolor{alerted text}{fg=epflrouge}
\setbeamercolor{headline}{fg=white,bg=epflrouge}
\setbeamercolor{author}{fg=black}
\setbeamercolor{example text}{fg=epflrouge,bg=epflperle}
\setbeamercolor{block title}{fg=white,bg=epflrouge}
\setbeamercolor{block body}{fg=black,bg=epflperle}
\setbeamercolor{block body example}{fg=black,bg=epflperle}
\setbeamercolor{caption name}{fg=black}
\newcommand{\@TheLogo}{ressources/epfl/logo-black.pdf}
\ifbool{IsDark}{
    \setbeamercolor{normal text}{fg=white}
    \setbeamercolor{background canvas}{bg=black}
    \setbeamercolor{structure}{fg=white}
    \setbeamercolor{title}{fg=white,bg=black}
    \setbeamercolor{footline}{fg=white} 
    \setbeamercolor{itemize items}{fg=epflrouge}
    \renewcommand{\@TheLogo}{ressources/epfl/logo-white.pdf}
}{
    \setbeamercolor{normal text}{fg=black}
    \setbeamercolor{background canvas}{bg=white}
    \setbeamercolor{frametitle}{fg=black,bg=white}
    \setbeamercolor{structure}{fg=epflrouge}
    \setbeamercolor{footline}{fg=black}
    \setbeamercolor{itemize items}{fg=epflrouge}
    \renewcommand{\@TheLogo}{ressources/epfl/logo-black.pdf}
}

% font sizes
\usefonttheme[onlymath]{serif}
\setbeamerfont{author}{size=\footnotesize}
\setbeamerfont{date}{size=\scriptsize}
\setbeamerfont{caption}{size=\scriptsize}
\setbeamerfont{normal text}{size=\footnotesize}
\setbeamerfont{equation}{size=\footnotesize}
\setbeamerfont{subsection in toc}{size=\footnotesize}
\setbeamerfont{section in toc}{size=\normalsize}
\renewcommand*{\bibfont}{\footnotesize}
\setbeamertemplate{itemize/enumerate body begin}{\footnotesize}
\setbeamertemplate{itemize/enumerate subbody begin}{\scriptsize}

% Code to get prettier boxes
\setbeamertemplate{blocks}[rounded][shadow=true]

% Bullets in several levels
\setbeamertemplate{itemize item}{\textbf{\normalsize\guillemotright}}
\setbeamertemplate{itemize subitem}{\normalsize\textendash}
\setbeamertemplate{itemize subsubitem}{\normalsize\textbullet}

% pink squares and triangle for items
\newcommand{\redsquareitem}{\item[\textcolor{epflgroseille}{\tiny$\blacksquare$}]}
\newcommand{\redtriangleitem}{\item[\textcolor{epflgroseille}{$\blacktriangleright$}]}

% to have a separate numbering for back-up slides 
\usepackage{appendixnumberbeamer}

% table of content in itemize style
\setbeamertemplate{section in toc}[square]
\setbeamertemplate{subsection in toc}[default]

% Define frame title and subtitle layout
\setbeamertemplate{frametitle}
{   \hbox{%
    \begin{beamercolorbox}[wd=.75\paperwidth,ht=20mm,dp=0mm, left]{frametitle}
        \usebeamerfont{frametitle}{\textbf{\insertframetitle}}\\
        \vspace{0.1ex}{\textcolor{\@DashColor}{\rule[0ex]{1cm}{\@DashHeight}} 
        \usebeamerfont{framesubtitle}\insertframesubtitle~\vphantom{phantomText}}\\
    \end{beamercolorbox}% 
    \begin{beamercolorbox}[wd=.25\paperwidth,ht=15mm,dp=2mm, left]{frametitle}
    \hfill{\vspace{1.5ex}\includegraphics[height=2ex]{\@TheLogo} \hspace*{2em}}
    \end{beamercolorbox}
    }%
    \vskip0pt%
}

% 
\newcommand{\setdepartment}[1]{\def\department{#1}}
\titlegraphic{\includegraphics[height=3ex]{\@TheLogo}}

% Define the title page
\setbeamertemplate{title page}
{
    \begin{tikzpicture}[overlay,remember picture]

        %% Add the cover image
        \node[above=0,inner sep=0] at (current page.south) {%
            \includegraphics[width=\paperwidth]{\@coverimage}};


        %% Add the logo in the bottom left
        \node[above left=5mm] at (current page.south east) {%
            \includegraphics[height=3ex]{ressources/epfl/logo-white.png}};

        %% Add the banner with the title, subtitle, subject and author(s)
        \node[below=.8cm,fill=white!85,minimum width={\paperwidth},inner ysep=25pt,opacity=0,text opacity=1] at (current page.north) {%
            \begin{minipage}{0.9\paperwidth}
                %% Format and add the title
                \color{epflrouge}\raggedright\largetitlestyle\fontsize{35}{35}\selectfont%
                {\inserttitle} \\[0.5ex]
                % Format and add (optional) subtitle and subject
                \color{white}\titlestyle\fontsize{20}{20}\selectfont%
                {\normalfont \insertsubtitle} \\[1.5ex]
                
                \fontsize{12}{12}
                {\normalfont \insertauthor} \\
            \end{minipage}};


        % %% Add the affiliation on the left
        % \node[rotate=0,below=5mm] at (current page.north) {%
        %     \ifdefvoid{\@affiliation}{}{\color{white}\titlestyle\@affiliation}};

        \end{tikzpicture}

%   \hbox{%
%    \begin{beamercolorbox}[wd=0.74\paperwidth,sep=8pt,left]{institute}
%       \usebeamerfont{institute}{\department\par \insertinstitute}
%     \end{beamercolorbox}
%     \begin{beamercolorbox}[wd=0.2\paperwidth,sep=8pt,left]{institute}
%      \usebeamercolor[fg]{titlegraphic}\hfill\inserttitlegraphic
%     \end{beamercolorbox}
%   }%
%   \begin{centering}
%     \begin{beamercolorbox}[sep=8pt,left]{title}
%       \usebeamerfont{title}\MakeUppercase{\inserttitle}\par%
%       \textcolor{\@DashColor}{\rule[0ex]{1cm}{\@DashHeight}} 
%     \end{beamercolorbox}%
%     \begin{beamercolorbox}[sep=8pt,left]{subtitle}
%       \ifx\insertsubtitle\@empty%
%       \else%
%         \vskip0em%
%         {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\MakeUppercase{\insertsubtitle}\par}%
%       \fi%     
%     \end{beamercolorbox}
%     \vskip0em\par
%     \begin{beamercolorbox}[sep=8pt,left]{author}
%         \usebeamerfont{author}{Presented by \insertauthor}
%     \end{beamercolorbox}
%     \begin{beamercolorbox}[sep=8pt,left]{date}
%       \usebeamerfont{date}{\insertdate}
%     \end{beamercolorbox}%\vskip0.5em
%     \end{centering}
}


% Define the bottom of each standard frame
\setbeamertemplate{footline}{
    % bottom bar
    \begin{beamercolorbox}[wd=\paperwidth, ht=10pt, dp=1pt]{footline}
    \usebeamerfont{footline}
    
    \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=south west, 
          xshift=10mm, 
          yshift=.4mm] 
         at (current page.south west) 
         {\insertdate}; 
    \end{tikzpicture}
    
    \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=south west, 
          xshift=35mm, 
          yshift=.4mm] 
          at (current page.south west) 
         {\insertauthor,~\department,~\insertshortinstitute}; 
    \end{tikzpicture}
    
    \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=south east, 
          xshift=-5mm, 
          yshift=0.5mm] 
         at (current page.south east) 
         {\insertframenumber \,/\, \inserttotalframenumber};
    \end{tikzpicture}
    
    \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=south east, 
          xshift=-15mm, 
          yshift=0.4mm] 
          at (current page.south east) 
         {\insertshorttitle}; 
    \end{tikzpicture}
    
    \end{beamercolorbox}
}

% add navigation symbols
\setbeamercolor{mycolor}{fg=white}%,bg=structure!30}
\addtobeamertemplate{footline}{
    \leavevmode%
    \hbox{%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=.5ex,right,rightskip=5mm]{mycolor}%
    \usebeamercolor[fg]{navigation symbols}\insertslidenavigationsymbol%
                                           \insertframenavigationsymbol%
                                           \insertsubsectionnavigationsymbol%
                                           \insertsectionnavigationsymbol%
                                           \insertdocnavigationsymbol%
                                           \insertbackfindforwardnavigationsymbol%
    \end{beamercolorbox}%
    }%
    \vskip0.5pt%
}{}

\mode<all>
