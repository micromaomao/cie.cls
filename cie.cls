\NeedsTeXFormat{LaTeX2e}
\newcommand\@camb{Lorem Ipsum}
\ProvidesClass{cie}[LaTeX class for Cambridge style exam papers.]

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
\RequirePackage{totcount}
\RequirePackage{scrextend}
\RequirePackage{dashrule}
\RequirePackage{pgffor}
\RequirePackage{changepage}
\RequirePackage{calculator}
\RequirePackage{xifthen}
\strictpagecheck

\LoadClass[a4paper,10pt]{article}

\RequirePackage[left=2cm, right=2cm, top=2cm, bottom=2cm, a4paper]{geometry}

\RequirePackage[hidelinks]{hyperref}

\renewcommand{\familydefault}{\sfdefault}

\newtotcounter{questions}
\newtotcounter{marks}
\newtotcounter{emptypages}

\newbox\hchoicemeasurebox
\def\aux@ciecls@fname{\jobname.aux_ciecls}
\newread\aux@ciecls@stream
\openin\aux@ciecls@stream=\aux@ciecls@fname\relax
\ifeof\aux@ciecls@stream \message{\aux@ciecls@fname\ does not exist.} \else \closein\aux@ciecls@stream \input \aux@ciecls@fname \message{Inputed \aux@ciecls@fname} \fi
\newwrite\aux@ciecls
\openout\aux@ciecls=\aux@ciecls@fname

\def\maker#1{
  \gdef\@maker{#1}
}
\def\program#1{
  \gdef\@program{#1}
}
\def\candidateinfoboxes#1{
  \gdef\@candidateinfoboxes{#1}
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
\def\timelimit#1{
  \gdef\@timelimit{#1}
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
\def\centerlogo#1{
  \gdef\@centerlogo{#1}
}

\newcommand\candidatenamebox{%
  \tikz[scale=1]{
    \@candidateboxlabel{\mbox{CANDIDATE} \mbox{NAME}};
    \draw (2.5cm, 0) rectangle (\linewidth, \@candidateboxheight);
  }%
}
\newcommand\centernumberbox{%
  \tikz[scale=1]{
    \@candidateboxlabel{\mbox{CENTER} \mbox{NUMBER}};
    \draw (2.5cm, 0) rectangle ++ (5cm, \@candidateboxheight);
    \draw (3.5cm, 0) foreach \x in {1,...,4} { -- ++ (0, \@candidateboxheight) ++ (1cm, -\@candidateboxheight) }
  }%
}
\newcommand\candidatenumberbox{%
  \tikz[scale=1]{
    \@candidateboxlabel{\mbox{CANDIDATE} \mbox{NUMBER}};
    \draw (2.5cm, 0) rectangle ++ (4cm, \@candidateboxheight);
    \draw (3.5cm, 0) foreach \x in {1,...,3} { -- ++ (0, \@candidateboxheight) ++ (1cm, -\@candidateboxheight) }
  }%
}
\newcommand\candidateclassbox{%
  \tikz[scale=1]{
    \@candidateboxlabel{\mbox{CLASS}};
    \draw (2.5cm, 0) rectangle ++ (5cm, \@candidateboxheight);
  }%
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
\candidateinfoboxes{%
  \noindent \candidatenamebox \vspace{1mm} \\%
  \noindent \centernumberbox \hfill \candidatenumberbox%
}
\subject{EXAMPLE SUBJECT}
\syllabus{0000}
\season{\today{}}
\component{00}
\componentfull{Example paper}
\timelimit{As long as you want}
\answeron{
  Candidate answers on this paper.
}
\additionmaterials{
  No Additional materials are required.
}
\writinginstructions{
  Write your \textbf{centre number, candidate number and name} on \textbf{all} the work you hand in. \\
  Write in \textbf{pen or pencil}, but not lighter than HB. \\
  Do \textbf{not} use staples, paper clips, glue or correction fluid. \\\\
  \textbf{DO NOT WRITE IN ANY BARCODES.} \\
}
\testinginstructions{
  Answer \textbf{all} questions. \\
  Mobile phones may be used. \\
  You may lose marks if you do not show your working or if you do not use appropriate units. \\
}
\copyright{
  Copyright \@camb
}
\centerlogo{
  \LaTeX
}

\newcommand\@candidateboxlabel[1]{
  \path[draw=none] (0,0) -- (0,\@candidateboxheight)
    node[right=0, inner sep=0, pos=0.5, color=black, align=left, text width=2.5cm] {#1}
}

\newcommand\@isorare[1]{%
  \COPY{#1}{\c}%
  \ifnum1=\c%
    is%
  \else%
    are%
  \fi%
}

\newif\ifmarkscheme
\newcommand\printanswer{\markschemetrue}
\def\ifnotmarkscheme{\ifmarkscheme\else}

\newcommand\coverpage{
  % Logo & testing institution
  \noindent \tikz[scale=1,every node/.style={inner sep=0,outer sep=0}]{
    \path[draw=none, use as bounding box] (0,0) rectangle (\linewidth, 2cm);
    \filldraw[color=black] (0,0) node[above right=0.1cm and 0, text width=2.0cm, color=white, align=center]
      {\fitlogoline{\@maker} \@program}
      rectangle (2cm,2cm);
    \path[draw=none] (2cm, 2cm) -- (2cm, 0cm)
      node[right=0.5cm, pos=0.5, color=black, align=left] {\textbf{\@makerfull} \\ \@programfull};
  } \vspace{3mm} \\
  \ifnotmarkscheme \@candidateinfoboxes \vspace{3mm} \fi

  {
    \renewcommand*{\arraystretch}{1.3}
    \noindent \begin{tabularx}{\linewidth}{@{}l X r@{}}
      \hline \rule{0pt}{4ex}\textbf{\@subject} & & \textbf{\@syllabus/\@component} \\
      \@componentfull & & \textbf{\@season} \\
      & & \ifnotmarkscheme \textbf{\@timelimit} \fi \\
      \ifmarkscheme MARK SCHEME \else \@answeron \fi \\
      \ifmarkscheme Maximum Mark: \total{marks} \else \@additionmaterials \fi \vspace{0.3cm} \\ \hline
    \end{tabularx}
  } \vspace{0.3cm} \\
  \setlength{\parindent}{0pt}
  \setlength{\parskip}{\baselineskip}
  \ifthenelse{\boolean{markscheme}}{
    This mark scheme is published as an aid to teachers and candidates, to indicate
    the requirements of the examination. It shows the basis on which Examiners were
    instructed to award marks. It does not indicate the details of the discussions
    that took place at an Examiners’ meeting before marking began, which would have
    considered the acceptability of alternative answers.

    Mark schemes should be read in conjunction with the question paper and the
    Examiner Report.

    \@maker{} will not enter into discussions about these mark schemes.

    Question paper could be generated by removing the \texttt{\textbackslash{}printanswer} command at
    the beginning of the tex file for this paper, if you have it.
  }{
    \textbf{Some reminders:} \\\\
    \@writinginstructions
    \\
    \@testinginstructions
    At the end of the examination, fasten all your work securely together. \\
    The number of marks is given in brackets [\hspace{1em}] at the end of each question or part question. \\
    There are \total{questions} questions, and the maximium mark you can get is \total{marks}. \\
  }

  \vfill
  \noindent\centerline {This \ifmarkscheme mark scheme \else paper \fi contains \pageref{LastPage} pages, of which \total{emptypages} \@isorare{\totvalue{emptypages}} empty.} \\
  \rule{\linewidth}{0.4pt} \\
  \begin{tabularx}{\linewidth}[t]{@{}X c X@{}}
    \@copyright & \@centerlogo & \\
  \end{tabularx}

  \thispagestyle{empty}
  \newpage
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \chead{\textbf{\thepage}}
  \cfoot{Page \thepage{} of \pageref{LastPage}}
  \setcounter{section}{0}
  \setcounter{questions}{0}
  \setcounter{emptypages}{0}
}

\newcommand\@quelle[1]{{%
      \unskip\nobreak\hfil\penalty50
      \hskip2em\hbox{}\nobreak\hfil #1%
      \parfillskip=0pt \finalhyphendemerits=0 \par}}

\newif\ifinquestion
\inquestionfalse
\newcounter{submarks}
\newcounter{subq}

\newcommand\@questionmargin{1cm}

\newcommand\printtotalmark{
  \unless\ifinquestion
    \ClassError{cie}{This must be called in question.}
  \fi
  \nopagebreak
  \ifmarkscheme
    \textbf{Total: \thesubmarks{}.}
  \else
    \rule{\linewidth}{0.4pt}
    Total mark for question \thequestions: \textbf{\thesubmarks}, all questions total to \themarks{} at this point.
  \fi
}

\newcommand\markschemecontent[1]{
  \ifthenelse{\boolean{markscheme}}{#1}{}
}

\newcommand\point[1]{
  \addtocounter{submarks}{#1}
  \addtocounter{marks}{#1}
  \pointnoadd{#1}
}
\newcommand\pointnoadd[1]{
  \@quelle{[#1]}
}
\newcommand\addtopapermark[1]{
  \addtocounter{marks}{#1}
}
\newcommand\award[1]{\textbf{#1}'}

\newcounter{subquestions}

\newcommand\subquestion{%
  \ifmarkscheme \ifthenelse{\value{subquestions}>0}{\vspace{-0.5\parskip}\noindent\rule{\linewidth}{.2pt}\vspace{0.5\parskip}}{} \fi%
  \refstepcounter{subquestions}\label{q\thequestions{}s\thesubquestions}%
  \textbf{\alph{subquestions}} \hspace{0.3cm}%
}

\newif\ifnexthchoicelinebreak

\newenvironment{question}{
  \setcounter{submarks}{0}%
  \setcounter{subquestions}{0}%
  \ifinquestion%
    \ClassError{cie}{Nested question is not supported. Use \\subquestion instead.}%
  \fi%
  \inquestiontrue%
  \refstepcounter{questions}\label{q\thequestions}%
  \begin{addmargin}[\@questionmargin]{\@questionmargin}%
  \makebox[0pt][r]{\textbf{\thequestions}\hspace{0.5cm}}%
  \gdef\mcqcurrentanswer{N}%
  \gdef\mcqcurrentcorrectanswer{N}%
  \setbox\hchoicemeasurebox=\hbox{}%
  \edef\@bname{hchoiceq\thequestions vertical}%
  \ifcsname if\@bname\endcsname \else \provideboolean{\@bname}\fi%
  \nexthchoicelinebreakfalse%
  \noindent%
}{%
  \edef\@bname{hchoiceq\thequestions vertical}
  \ifthenelse{\wd\hchoicemeasurebox>\linewidth}{%
  \edef\wr@act{\write\aux@ciecls{\string\provideboolean{\@bname}\string\setboolean{\@bname}{true}}}%
  \wr@act%
  }{}%
  \ifthenelse{\boolean{markscheme} \AND \not \equal{\mcqcurrentcorrectanswer}{N}}{

    \textbf{Answer: }\mcqcurrentcorrectanswer

  }{}
  \end{addmargin}
  \inquestionfalse
  \vspace{0.33cm}
  \filbreak
}

\newcommand\singlewritingline{
  \ifnotmarkscheme .\leaders\hbox{.}\hfill \hfil \fi
}
\newcommand\writinglinestillvfill{
  \ifnotmarkscheme \xleaders\vbox{\vspace{1.2em}\singlewritingline}\vfill \vfil \fi
}
\newcommand*\writinglinesfor[1]{
  \ifnotmarkscheme \vbox to #1{\leaders\vbox{\vspace{1.2em}\singlewritingline}\vfill \vfil} \fi
}

\newcommand\blankpage{
  \clearpage
  \centerline{\textbf{BLANK PAGE}}
  \stepcounter{emptypages}
}

\newcommand\finalstuff{
  \ifthenelse{\boolean{markscheme}}{}{
    \checkoddpage
    \unless\ifoddpage
      \blankpage
    \fi
    \blankpage
  }
  \ifnotmarkscheme \vfill \rule{\linewidth}{0.8pt} \fi \small Permission to reproduce items where third-party
  owned material protected by copyright is included has been sought and cleared
  where possible. Every reasonable effort has been made by the publisher
  (\@maker) to trace copyright holders, but if any items requiring clearance
  have unwittingly been included, the publisher will be pleased to make amends
  at the earliest possible opportunity.
  \closeout\aux@ciecls
}

\renewcommand\section[2]{
  \refstepcounter{section}\label{sec\thesection}
  \centerline{\textbf{Section \Alph{section}}}
  \centerline{#2}
}

\newbox\hchoicescratch

\newcommand\hchoice[2]{%
  \setbox\hchoicescratch=\hbox{\textbf{#1}\nobreak\hspace{0.3cm}\nobreak#2\hspace{1cm}}%
  \ifthenelse{\boolean{hchoiceq\thequestions vertical}}{%
    \ifthenelse{\boolean{nexthchoicelinebreak}}{\\}{}\unhcopy\hchoicescratch\nexthchoicelinebreaktrue%
  }{%
    \unhcopy\hchoicescratch%
  }%
  \gdef\mcqcurrentanswer{#1}%
  \setbox\hchoicemeasurebox=\hbox{\copy\hchoicemeasurebox \unhcopy\hchoicescratch}%
}
\newcommand\setanswer{%
  \xdef\mcqcurrentcorrectanswer{\mcqcurrentanswer}%
  \addtocounter{submarks}{1}%
  \addtocounter{marks}{1}%
}
