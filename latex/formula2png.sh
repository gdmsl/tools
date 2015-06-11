#!/bin/bash
#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
#
# DESCRIPTION: Convert a LaTeX math formula from a given file to a
#              png image. The given file should contain only the formula.
#              The output file will be named after the input, for example
#              foo.tex will give to foo.png
#
# USAGE: ./formula2png.sh input.tex
#

echo -n "\documentclass[12pt]{standalone}
\usepackage{varwidth}

\usepackage[utf8x]{inputenc}
\usepackage[T1]{fontenc}

\usepackage{amsmath, amssymb, graphics, setspace}
\newcounter{mathematicapage}

\begin{document}
\begin{varwidth}{50in}
\begin{equation*}
" > /tmp/formula2png.tex

cat $1 >> /tmp/formula2png.tex

echo -n "
\end{equation*}
\end{varwidth}
\end{document}
" >> /tmp/formula2png.tex

sed -i '/^\s*$/d' /tmp/formula2png.tex

pdflatex -output-directory /tmp /tmp/formula2png.tex
convert -transparent-color white -density 300 /tmp/formula2png.pdf -quality 90 $(basename $1 .tex).png
