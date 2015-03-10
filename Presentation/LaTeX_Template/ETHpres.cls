%% file ETHpres.cls
%% Version 2.0 new form of corporated design -- � Dieter Hennig 
%% Version 2.1 29.09.2013
%% Version 2.2 02.01.2014
%%

%Based on ETH official latex template
%Modified for ASL by Alvaro Estandia (09.02.2015) (ealvaro@student.ethz.ch)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ETHpres}[2014/01/02 ETH Presentation  Ver. 2.2]
 
% Ensure that \pdfoutput is defined. 
\ifx\pdfoutput\@undefined \newcount\pdfoutput \fi
\ifx\pdfoutput\relax \newcount\pdfoutput \fi

%% --- Package loading ---
\RequirePackage{ifthen}
\RequirePackage{fix-cm}               % suppress some warnings about small fonts
\RequirePackage{kvoptions}
% Option declarations for kvoptions
% -------------------
\SetupKeyvalOptions{family=ETHpres,prefix=ETHpres@}
% trb default values for basic-documentclass and basic-documentclass options 
\providecommand\ETHpres@ClassType{scrartcl} 
\providecommand\ETHpres@ClassOption{pagesize,fontsize=11pt,parskip=half-,
                                    numbers=noendperiod,captions=nooneline,
                                    toc=nolistof,toc=nobib}
\DeclareBoolOption[true]{fourtothree} % default format 4:3
\DeclareBoolOption[false]{DepLogo}    % Departement-Logo for leftside footer

\PassOptionsToClass{\ETHpres@ClassOption}{\ETHpres@ClassType}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{\ETHpres@ClassType}}
%% --- Execution of options ---
\ProcessKeyvalOptions*
\LoadClass{\ETHpres@ClassType}




%% --- papersize like beamer
\ifthenelse{\boolean{ETHpres@fourtothree}}%
{\KOMAoption{paper}{128mm:96mm}\setlength{\textwidth}{116mm}}% 4:3
{\KOMAoption{paper}{160mm:90mm}\setlength{\textwidth}{148mm}}% 16:9

% === font ====================================================================
\usepackage[T1]{fontenc}% for correct hyphenation and T1 encoding
\AfterFile{t1lmss.fd}{  % see http://www.komascript.de/node/823
  \DeclareFontShape{T1}{lmss}{b}{n}
  {<->ssub*lmss/bx/n}{}
}
\linespread{1.12}           % enlarge line space
\usepackage{lmodern}        % latin modern font
\usepackage[scaled=.95]{helvet}% helvetica as the origin of arial
\usepackage[helvet]{sfmath}    % for the mathematical enviroments
\renewcommand{\familydefault}{\sfdefault}
\usepackage{microtype}         % for character protrusion and font expansion

% === math packages ===========================================================
\usepackage{amsthm}     % theorem environments
\usepackage{bm}         % for bold math symbols
\usepackage{enumitem}   % for automatic numbering of new enumerate environments

% === colors ==================================================================
\usepackage{xcolor}            % color package; load before tocstyle
\usepackage{tikz}              % sophisticated graphics package
\usepackage[export]{adjustbox} % used by the titlepage

% === page structure ==========================================================
\usepackage{calc}% working with lengths, counters etc.
% 4:3 textwidth=128mm-11mm = 117mm, 16:9 textwidth=160mm-11mm= 149mm
\usepackage[includeheadfoot,
            top= 1mm, bottom=3.5mm,
            left=5.5mm, right=5.5mm,
            headsep=0mm, footskip=1mm]{geometry}% set page layout parameters 
%\ifthenelse{\boolean{ETHpres@fourtothree}}%
%  {\setlength{\textwidth}{116mm}}% 4:3
%  {\setlength{\textwidth}{148mm}}% 16:9                      
\usepackage{scrpage2}% package for page style with not only uppercase letters in the head
\usepackage{titlesec}% for reducing space between ((sub)sub)sections and text
\usepackage{tocstyle}% for adjusting table of contents


% === toc style ===============================================================
\makeatletter
    \newtocstyle[noonewithdot]{nodotnopagenumber}{
    % define tocstyle without dots and page numbers
            \settocfeature{pagenumberbox}{\@gobble}
    }
\makeatother
\usetocstyle{nodotnopagenumber}

% ==== settings page style and foot ============================================
\pagestyle{scrheadings} % activates pagestyle from scrpage2
\clearscrheadfoot       % clear head and foot of scrheadings and scrplain
                        % setting for page head and foot
\setkomafont{pageheadfoot}{\normalfont\sffamily\color{black}}

% ==== foot ====================================================================
\addtokomafont{pagefoot}{\fontsize{4}{5}\selectfont}
\setkomafont{pagenumber}{\color{black}} 
\ifthenelse{\boolean{ETHpres@fourtothree}}%
  {\setfootwidth[-0.75mm]{119mm}}%  4:3
  {\setfootwidth[-1mm]{151mm}}% 16:9
\ifoot{% space for institute logo
   \ifthenelse{\boolean{ETHpres@DepLogo}} % Departement/Institut-Logo for the footer
   {%
    \begin{minipage}[b]{25mm}
      \includegraphics[width=24mm]{asl_logo_right.pdf}
    \end{minipage}}{}% else empty
}% end ifoot (inner foot)
\ofoot{% footer outside
	\ifnum\value{page} < 10
	  \ETHauthor \quad | \quad \ETHdate \quad | \quad $\phantom{0}$\pagemark
   \fi
   \ifnum\value{page} > 9
	   \ETHauthor \quad \ETHdate \quad \pagemark
   \fi
}% end ofoot (outer foot)

% ====  new colors  ===========================================================
\definecolor{ETHa}{RGB}{31,64,122}      % ETH1
\definecolor{ETHb}{RGB}{72,90,44}       % ETH2
\definecolor{ETHc}{RGB}{18,105,176}     % ETH3
\definecolor{ETHd}{RGB}{114,121,28}     % ETH4
\definecolor{ETHe}{RGB}{145,5,106}      % ETH5
\definecolor{ETHf}{RGB}{111,111,100}    % ETH6
\definecolor{ETHg}{RGB}{168,50,45}      % ETH7
\definecolor{ETHh}{RGB}{0,122,150}      % ETH8
\definecolor{ETHi}{RGB}{149,96,19}      % ETH9
\newcommand*{\colorETHa}[1]{\textcolor{ETHa}{#1}}
\newcommand*{\colorETHb}[1]{\textcolor{ETHb}{#1}}
\newcommand*{\colorETHc}[1]{\textcolor{ETHc}{#1}}
\newcommand*{\colorETHd}[1]{\textcolor{ETHd}{#1}}
\newcommand*{\colorETHe}[1]{\textcolor{ETHe}{#1}}
\newcommand*{\colorETHf}[1]{\textcolor{ETHf}{#1}}
\newcommand*{\colorETHg}[1]{\textcolor{ETHg}{#1}}
\newcommand*{\colorETHh}[1]{\textcolor{ETHh}{#1}}
\newcommand*{\colorETHi}[1]{\textcolor{ETHi}{#1}}

% ==== old colors =============================================================
\definecolor{ETHblue}{RGB}{51,89,148}               % for Department-Logo (#335994)
\definecolor{ETHlightblue}{RGB}{100,149,224}
\definecolor{ETHbrown}{RGB}{148,116,51}
\definecolor{ETHred}{RGB}{161,82,71}
\definecolor{ETHdarkgray}{rgb}{0.282,0.322,0.361}    % for box (#48525c)
\newcommand*{\ETHblue}[1]{\textcolor{ETHblue}{#1}}
\newcommand*{\ETHlightblue}[1]{\textcolor{ETHlightblue}{#1}}
\newcommand*{\ETHbrown}[1]{\textcolor{ETHbrown}{#1}}
\newcommand*{\ETHred}[1]{\textcolor{ETHred}{#1}}
\newcommand*{\ETHdarkgray}[1]{\textcolor{ETHdarkgray}{#1}}


% === design element ========================================================== 
\newcommand*{\ETHtitelbild}
{%
\ifthenelse{\boolean{ETHpres@fourtothree}}{\ETHcolorbar\titelvierzudrei}{\ETHcolorbar\titelsechzehnzuneun}
}% end ETHtitelbild

\newcommand*{\ETHinverseseite}
{%
\ifthenelse{\boolean{ETHpres@fourtothree}}{\ETHcolorbar\inversvierzudrei}{\ETHcolorbar\inverssechzehnzuneun}
}% end ETHinverseseite

% === internal ================================================================
\newcommand*{\titelvierzudrei}{%
\begin{tikzpicture}[overlay]
     \node [shift={(-69.4mm,-115mm)}]  at (current page.north east)
      %% backside of the ETH dome
      {\includegraphics[width=\paperwidth-9mm,trim={0mm 75mm 0mm 60mm},clip]{title.jpg}};
  \end{tikzpicture}

  \vspace*{70.0mm}
  \hspace{-1.9mm}
  \begin{tikzpicture}[overlay]
  \ETHhintergrund
  \end{tikzpicture}

  \vspace{-40mm}
}% end titelvierzudrei

\newcommand*{\titelsechzehnzuneun}{%
\begin{tikzpicture}[overlay]
        \node [shift={(-85.6mm,-105.25mm)}]  at (current page.north east)
        %% backside of the ETH dome
        {\includegraphics[width=\paperwidth-9mm,trim={0mm 130mm 0mm 95mm},clip]{title.jpg}};
    \end{tikzpicture}

    \vspace*{64.5mm}
    \hspace{-2.1mm}
    \begin{tikzpicture}[overlay]
    \ETHhintergrund
    \end{tikzpicture}

    \vspace{-40mm}
}% end titelsechzehnzuneun

% === colored bar with the short ETH-Logo inside
\ifthenelse{\boolean{ETHpres@fourtothree}} % needed for ETHcolorbar below
{% true 4:3
\newcommand*{\ethbarbreit}{124mm}	% Breite
\newcommand*{\ethbarhoch}{8.75mm}	% Hoehe		
\newcommand*{\ethbaruhh}{2.5mm}	    % untere Hoehe
\newcommand*{\ethbaruhb}{2.5mm}	    % untere Breite
\newcommand*{\ethshiftx}{-118.5mm}   % x shift
\newcommand*{\ethshifty}{-90.5mm}    % y shift
}%
{% false 16:9
  \newcommand*{\ethbarbreit}{156mm}	   % Breite
  \newcommand*{\ethbarhoch}{8.75mm}	   % Hoehe		
  \newcommand*{\ethbaruhh}{2.5mm}	   % untere Hoehe
  \newcommand*{\ethbaruhb}{2.5mm}	   % untere Breite
  \newcommand*{\ethshiftx}{-151.25mm}      % x shift
  \newcommand*{\ethshifty}{-84.5mm}     % y shift
}% needed for ETHcolorbar
\newcommand*{\ETHcolorbar}{%
\begin{tikzpicture}[overlay]
      \hspace{-3.5mm}\draw[firstcolor,fill=firstcolor] (0,\ethbarhoch)--   %
      (\ethbarbreit,\ethbarhoch)--(\ethbarbreit,0)--(\ethbarbreit-\ethbaruhb,0)--  %
      (\ethbarbreit-\ethbaruhb,\ethbaruhh)--(\ethbaruhb,\ethbaruhh)--(\ethbaruhb,0)--%
      (0,0)--(0,\ethbarhoch); %
\node [shift={(\ethshiftx,\ethshifty)}]  at (current page.north east){\includegraphics[width=12.8mm]{eth_logo_kurz_neg_13.pdf}};%
\end{tikzpicture}}% end ETHcolorbar

\newcommand*{\ETHslide}{\ETHcolorbar\newline}

\newcommand*{\ETHminimal}{%
\begin{tikzpicture}[overlay]
      \hspace{-3.5mm}\draw[white,fill=white] (0,\ethbarhoch)--   %
      (\ethbarbreit,\ethbarhoch)--(\ethbarbreit,0)--(\ethbarbreit-\ethbaruhb,0)--  %
      (\ethbarbreit-\ethbaruhb,\ethbaruhh)--(\ethbaruhb,\ethbaruhh)--(\ethbaruhb,0)--%
      (0,0)--(0,\ethbarhoch); %
\node [shift={(\ethshiftx,\ethshifty)}]  at (current page.north east){\includegraphics[width=12.8mm]{eth_logo_kurz_pos_13.pdf}};%
\end{tikzpicture}\newline}% end ETHminimal

% === color backgrund for the titlepage
\ifthenelse{\boolean{ETHpres@fourtothree}}
{\newcommand*{\ethhintergrundbreite}{119.0mm}	% Breite
 \newcommand*{\ethhintergrundhoehe}{40mm}	    % Hoehe
}%
{\newcommand*{\ethhintergrundbreite}{151mm}	    % Breite
 \newcommand*{\ethhintergrundhoehe}{39.2mm}	    % Hoehe		
}%
\newcommand*{\ETHhintergrund}{\draw[secondcolor,fill=secondcolor]%
(0,\ethhintergrundhoehe)--(\ethhintergrundbreite,\ethhintergrundhoehe)%
--(\ethhintergrundbreite,0)--(0,0)--(0,\ethhintergrundhoehe);}%

% === color backgrund for the inverseseite
\newcommand*{\inversvierzudrei}{%
  
  \vspace*{70.0mm}
  \hspace{-1.9mm}
  \begin{tikzpicture}[overlay]
  \ETHinverserhintergrund
  \end{tikzpicture}

  \vspace{-80mm}
}% end inversvierzudrei

\newcommand*{\inverssechzehnzuneun}{%

  \vspace*{64.5mm}
  \hspace{-2.1mm}
  \begin{tikzpicture}[overlay]
  \ETHinverserhintergrund
  \end{tikzpicture}

  \vspace{-74.5mm}
}% end inverssechzehzuneun

% === color backgrund for the titlepage
\ifthenelse{\boolean{ETHpres@fourtothree}}
{\newcommand*{\ethinverserhintergrundhoehe}{80.15mm}}   % Hoehe 4:3
{\newcommand*{\ethinverserhintergrundhoehe}{75.0mm}}   % Hoehe 16:9	
	
\newcommand*{\ETHinverserhintergrund}{\draw[secondcolor,fill=secondcolor]%
(0,\ethinverserhintergrundhoehe)--(\ethhintergrundbreite,\ethinverserhintergrundhoehe)%
--(\ethhintergrundbreite,0)--(0,0)--(0,\ethinverserhintergrundhoehe);}%

% === some helpfull definitions ===============================================
% === theorems, proofs
\newtheoremstyle{ETHthmstyle}%
	{0.5em}% space above
	{0.5em}% space below
	{}% body font
	{}% indent amount
	{\sffamily\bfseries}% head font
	{}% punctuation after head
	{\newline}% space after head
	{\thmname{#1}\ \thmnote{(#3)}}% head spec
\theoremstyle{ETHthmstyle}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{remark}[theorem]{Remark}
\newtheorem{algorithm}[theorem]{Algorithm}
\renewcommand*\proofname{Proof}
\makeatletter% correct qed adjustment
    \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}
    \normalfont\topsep2\p@\@plus2\p@\relax
    \trivlist
    \item[\hskip\labelsep
	      \sffamily\bfseries #1]\mbox{}\hfill\\*\ignorespaces
          }{\popQED\endtrivlist\@endpefalse
    }
\makeatother
% === note environment
\newenvironment{note}[1]{
  \labeling{#1}
		\item[#1]\ignorespaces
    }{\endlabeling
}

% ==== commands ================================================================
% === decoration
\usetikzlibrary{decorations.pathmorphing,shadows}
% === box
\newcommand*{\ETHbox}[2]{% width, content
	\par\noindent
	\begin{tikzpicture}[ETHnodestyle/.style={rectangle,rounded
            corners,draw=ETHdarkgray!40!white,
            thick,inner sep=2mm,text justified,top color=secondcolor!30!white, bottom color=secondcolor,above}]%
		    \node[ETHnodestyle,at={(0.5*#1+2mm+0.4pt,0)}]{%
			\begin{minipage}[t]{#1}
				#2
			\end{minipage}%
		    };
	\end{tikzpicture}%	
	\par\vspace{-1.3em}
}
% === labels
\newcommand*{\ETHitem}{\raisebox{1pt}{\tikz\fill[sharp
    corners](0,0)rectangle+(3.4pt,3.4pt);}}  
% end of file
