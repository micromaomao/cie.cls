\NeedsTeXFormat{LaTeX2e}
\newcommand\@camb{Lorem Ipsum}
\ProvidesClass{cie}[LaTeX class for {\@camb} style exam papers.]

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{lmodern}

\RequirePackage{tikz}
\usetikzlibrary{positioning}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\LoadClass[a4paper,10pt]{article}

\RequirePackage[left=2cm, right=2cm, top=2cm, bottom=2cm, a4paper]{geometry}

\renewcommand{\familydefault}{\sfdefault}

\def\maker#1{
  \gdef\@maker{#1}
}
\def\program#1{
  \gdef\@program{#1}
}
\def\makerfull#1{
  \gdef\@makerfull{#1}
}
\def\programfull#1{
  \gdef\@programfull{#1}
}
\def\subject#1{
  \gdef\@subject{#1}
}
\def\syllabus#1{
  \gdef\@syllabus{#1}
}
\def\season#1{
  \gdef\@season{#1}
}
\def\component#1{
  \gdef\@component{#1}
}
\def\componentfull#1{
  \gdef\@componentfull{#1}
}
\def\time#1{
  \gdef\@time{#1}
}
\def\answeron#1{
  \gdef\@answeron{#1}
}
\def\additionmaterials#1{
  \gdef\@additionmaterials{#1}
}
\def\writinginstructions#1{
  \gdef\@writinginstructions{#1}
}
\def\testinginstructions#1{
  \gdef\@testinginstructions{#1}
}
\def\copyright#1{
  \gdef\@copyright{#1}
}
\def\logo#1{
  \gdef\@logo{#1}
}

\def\@logotwidth{1.8cm}
\def\@candidateboxheight{1.2cm}

\newcommand\fitlogoline[1]{
  \resizebox{\@logotwidth}{\height}{#1}
}

\maker{{\@camb}}
\program{\fitlogoline{\small International} \fitlogoline{\textbf{AS \& A Level}}}
\makerfull{{\@camb} International Examinations}
\programfull{{\@camb} International Advanced Subsidiary and Advanced Level}
\subject{EXAMPLE SUBJECT}
\syllabus{0000}
\season{\today{}}
\component{00}
\componentfull{Example paper}
\time{As long as you want}
\answeron{
  Candidate answers on this paper.
}
\additionmaterials{
  No Additional Materials are required.
}
\writinginstructions{
  Write your \textbf{centre number, candidate number and name} on \textbf{all} the work you hand in. \\
  Write in \textbf{pen or pencil}, but not lighter than HB. \\
  Do \textbf{not} use staples, paper clips, glue or correction fluid. \\
}
\testinginstructions{
  Answer \textbf{all} questions. \\
  Mobile phones may be used. \\
  You may lose marks if you do not show your working or if you do not use appropriate units. \\
}
\copyright{
  CC-BY-SA 4
}
\logo{
  \LaTeX
}

\newcommand\@candidateboxlabel[1]{
  \path[draw=none] (0,0) -- (0,\@candidateboxheight)
    node[right=0, inner sep=0, pos=0.5, color=black, align=left, text width=2.5cm] {#1}
}

\newcommand\coverpage{
  % Logo & testing institution
  \noindent \tikz[scale=1,every node/.style={inner sep=0,outer sep=0}]{
    \path[draw=none, use as bounding box] (0,0) rectangle (\textwidth, 2cm);
    \filldraw[color=black] (0,0) node[above right=0.1cm and 0, text width=2.0cm, color=white, align=center]
      {\fitlogoline{\@maker} \@program}
      rectangle (2cm,2cm);
    \path[draw=none] (2cm, 2cm) -- (2cm, 0cm)
      node[right=0.5cm, pos=0.5, color=black, align=left] {\textbf{\@makerfull} \\ \@programfull};
  } \vspace{3mm} \\
  \noindent \tikz[scale=1]{
    \@candidateboxlabel{\mbox{CANDIDATE} \mbox{NAME}};
    \draw (2.5cm, 0) rectangle (\textwidth, \@candidateboxheight);
  } \vspace{1mm} \\
  \noindent \tikz[scale=1]{
    \@candidateboxlabel{\mbox{CENTER} \mbox{NUMBER}};
    \draw (2.5cm, 0) rectangle ++ (5cm, \@candidateboxheight);
    \draw (3.5cm, 0) foreach \x in {1,...,4} { -- ++ (0, \@candidateboxheight) ++ (1cm, -\@candidateboxheight) }
  } \hfill
  \tikz[scale=1]{
    \@candidateboxlabel{\mbox{CANDIDATE} \mbox{NUMBER}};
    \draw (2.5cm, 0) rectangle ++ (4cm, \@candidateboxheight);
    \draw (3.5cm, 0) foreach \x in {1,...,3} { -- ++ (0, \@candidateboxheight) ++ (1cm, -\@candidateboxheight) }
  } \vspace{3mm}

  {
    \renewcommand*{\arraystretch}{1.3}
    \noindent \begin{tabularx}{\textwidth}{@{}l X r@{}}
      \hline \rule{0pt}{4ex}\textbf{\@subject} & & \textbf{\@syllabus/\@component} \\
      \@componentfull & & \textbf{\@season} \\
      & & \textbf{\@time} \\
      \@answeron \\
      \@additionmaterials \vspace{0.3cm} \\ \hline
    \end{tabularx}
  } \vspace{0.3cm} \\
  \textbf{Some reminders:} \\\\
  \@writinginstructions
  \\
  \textbf{DO NOT WRITE IN ANY BARCODES.} \\
  \\
  \@testinginstructions
  At the end of the examination, fasten all your work securely together. \\
  The number of marks is given in brackets [\hspace{1em}] at the end of each question or part question. \\

  \vfill
  \noindent\centerline {This paper contains \pageref{LastPage} pages.} \\
  \rule{\textwidth}{0.4pt} \\
  \begin{tabularx}{\textwidth}[t]{@{}X c X@{}}
    \@copyright & \@logo & \\
  \end{tabularx}

  \thispagestyle{empty}
  \newpage
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \cfoot{Page \thepage{} of \pageref{LastPage}}
}
