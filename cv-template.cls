% ------------ Identification ------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv-template}[v.0.0 Customized CV class]


% ------------ Packages ------------
\RequirePackage[T1]{fontenc}
\RequirePackage[bitstream-charter]{mathdesign}      % display font
\RequirePackage{fontawesome}                        % icon font
\RequirePackage[a4paper]{geometry}                  % page layout
\RequirePackage[dvipsnames]{xcolor}                 % header background color
\RequirePackage{xifthen}                            % if-else


% ------------ Inherences ------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


% ------------ Commands ------------
\newcommand*{\updatedate}[1]{\def \@updatedate{#1}}
\newcommand*{\name}[1]{\def \@name{#1}}
\newcommand*{\address}[2]{\def \@addressstreet{#1} \def \@addresscity{#2}}
\newcommand*{\phone}[1]{\def \@phone{#1}}
\newcommand*{\email}[1]{\def \@email{#1}}
\newcommand*{\github}[1]{\def \@github{#1}}

\newcommand*{\skipempty}[2]{\ifthenelse{\isempty{#1}}{}{#2}}


% ------------ Styles ------------
% Header:
\newcommand*{\styledocument}[1]{{\LARGE \bfseries #1}}
\newcommand*{\stylename}[1]{{\Large \bfseries #1}}
\newcommand*{\styleemail}[1]{\href{mailto:#1}{\UrlFont{#1}}}
\newcommand*{\stylephone}[1]{#1}
% Section:
\newcommand*{\stylesection}[1]{{\Large \bfseries #1}}
\newcommand*{\styletitle}[1]{{\large \bfseries #1}}
\newcommand*{\stylesubtitle}[1]{{\large #1}}
\newcommand*{\styleduration}[1]{{\itshape #1}}
\newcommand*{\stylelocation}[1]{#1}
\newcommand*{\stylearea}[1]{#1}
\newcommand*{\styledescription}[1]{#1}
\newcommand*{\stylegithub}[1]{\href{#1}{\faGithub}}


% ------------ Layout ------------
\geometry{margin=1.75cm}
\setlength \parindent{0pt}

\newcommand*{\displayheader}{
    \begin{tabular*}{\linewidth}{@{}p{10cm} @{\extracolsep{\fill}}r}
        % \styledocument{}    &   \@updatedate            \\[10pt]
        \stylename{\@name}                  &                           \\[5pt]
        \stylephone{\@phone}                &   \@addressstreet         \\[3pt]
        \styleemail{\@email}                &   \@addresscity           \\[3pt]
        % \stylegithub{\@github}              &                           \\[3pt]
    \end{tabular*} \leavevmode
}

\newcommand*{\createsection}[1]{
    \vspace*{5pt}
    \stylesection{#1} \\[7pt]
}

\newcommand*{\createtitle}[5]{
    \begin{tabular*}{\linewidth}{p{.80\linewidth} @{\extracolsep{\fill}}r}
        \styletitle{#1}         &   \styleduration{#2}     \\[5pt]
        \stylearea{#3}          &   \stylelocation{#4}     \\
    \end{tabular*} \leavevmode \\
    \styledescription{#5}
}

\newcommand*{\createhonor}[4]{

    \begin{tabular*}{\linewidth}{@{\hskip 4pt}p{.90\linewidth} @{\extracolsep{\fill}}r}
        \styletitle{#1} \stylesubtitle{#2}     &   \styleduration{#3}  \\[2.5pt]
        \hspace*{3pt} \skipempty{#4}{\styledescription{#4} \\[8pt]}
    \end{tabular*} \leavevmode \\ \vspace{1\baselineskip plus 2pt}
}

\newcommand*{\createproject}[4]{
    \begin{tabular*}{\linewidth}{p{.75\linewidth} @{\extracolsep{\fill}}r}
        \styletitle{#1}       &   \styleduration{#2}
    \end{tabular*} \leavevmode
    \styledescription{#4} \vspace{0.5\baselineskip plus 2pt}
}