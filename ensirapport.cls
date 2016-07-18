%------------------------------------------------------------------------------%
%                                                                              %
%                                                                              %
%   EnsiRapport                                                                %
%                                                                              %
%   Version : 1.0                                                              %
%                                                                              %
%   Auteur : Arthur Sonzogni                                                   %
%                                                                              %
%------------------------------------------------------------------------------%
%                                                                              %
%   modified for reportASZ.tex                                                 %
%                                                                              %
%------------------------------------------------------------------------------%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ensirapport}[2014/01/01 classe pour des rapport à l'ensimag]

\typeout{}
\typeout{-----[ Ensirapport <debut> ]------}
\typeout{}

% classe de base

\LoadClassWithOptions{article}

% extensions

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage[english]{babel}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{eurosym}
\RequirePackage[dvipsnames,svgnames,table]{xcolor}

\DeclareOption{margeCorrection}{
	\AtEndOfClass{
		\RequirePackage[margin=2.5cm]{geometry}
	}
}

%Colors
\definecolor{gray}{HTML}{AAAAAA}


% modification style des liens
\DeclareOption{liens}{
	\AtEndOfClass{
		\RequirePackage{hyperref}
		\hypersetup{ 
			colorlinks=true,
			breaklinks=true,
			urlcolor= blue, 
			linkcolor= black, 
			citecolor= green
			}
	}
}
\ProcessOptions

% une commande pour ne pas que maketitle efface ces traces (@title,@date,@author)
% c'est une commande privée du package
\newcommand{\preserveMaketitle}{
	\let\oldmaketitle\maketitle
	\renewcommand{\maketitle}{
		\let\@preservedTitle\@title
		\let\@preservedAuthor\@author
		\let\@preservedDate\@date
		\oldmaketitle
		\let\@title\@preservedTitle
		\let\@author\@preservedAuthor
		\let\@date\@preservedDate
	}
}

% config fancyhdr
\DeclareOption{entete}{
	\AtEndOfClass{
		\RequirePackage{fancyhdr}
		\preserveMaketitle
		\RequirePackage{wallpaper}
		\RequirePackage{lastpage}

		\pagestyle{fancy}

		\fancyhf{}

		\renewcommand\headrule{
			\begin{minipage}{1\textwidth}
				\hrule width \hsize \kern 1mm \hrule width \hsize height 2pt 
			\end{minipage}
		}

		\renewcommand{\headrulewidth}{1pt}
		\renewcommand{\footrulewidth}{1pt}
		\lhead{ \textbf{\@author}}
		\chead{ \nouppercase\leftmark}
		\rhead{ \@date }
		\rfoot{ \textbf{page \thepage /\pageref*{LastPage}} }

		\fancypagestyle{plain}{ %
			\fancyhf{}
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{1pt}
			\lhead{ \textbf{\@author}}
			\rhead{ \@date }
			\rfoot{ \textbf{page \thepage  /\pageref*{LastPage} } }
		}

	}
}
\ProcessOptions

% config entete-ensimag
\DeclareOption{entete-ensimag}{
	\AtEndOfClass{
		\RequirePackage{fancyhdr}
		\preserveMaketitle
		\RequirePackage{lastpage}


		\pagestyle{fancy}

		\fancyhf{}
		
		\def\headheightone{1pt}
        \def\headheighttwo{1pt}

		\renewcommand\headrule{
			\begin{minipage}{1\textwidth}
				\hrule width \hsize height \headheightone
				%\kern 1mm
				%\hrule width \hsize height \headheighttwo
			\end{minipage}
		}
		\renewcommand\footrule{
			\begin{minipage}{1\textwidth}
                \color{gray}
				\hrule width \hsize height \headheightone
				%\kern 1mm
				%\hrule width \hsize height \headheighttwo
			\end{minipage}
		}

		\renewcommand{\headrulewidth}{1pt}
		\renewcommand{\footrulewidth}{1pt}
		\lhead{ 
			\textbf{\@author}
		}
		\chead{
		}
		\rhead{ \@date }
        \rfoot{\textbf{page \thepage  /\pageref{LastPage}} }


		\fancypagestyle{plain}{ %

			\fancyhf{}
			\renewcommand{\headheightone}{0pt}
			\renewcommand{\headheighttwo}{0pt}
			\renewcommand{\footrulewidth}{1pt}
			\lhead{}
			\chead{}
            \rhead{}
            \rfoot{ \textbf{page \thepage /\pageref{LastPage}} }
		}

	}
}
\ProcessOptions

% minted
\DeclareOption{minted}{
	\AtEndOfClass{
		\RequirePackage{minted}
	}
}
\ProcessOptions

% permet d'include directement des fichiers eps.
\RequirePackage{epstopdf}


\typeout{}
\typeout{-----[ Ensirapport <fin> ]------}
\typeout{}
