#!/bin/bash
set -eo pipefail

pdflatex -interaction=nonstopmode -halt-on-error BA-Dokumentation-Template.tex
biber *.bcf
makeglossaries BA-Dokumentation-Template
pdflatex -interaction=nonstopmode -halt-on-error BA-Dokumentation-Template.tex
pdflatex -interaction=nonstopmode -halt-on-error "\providecommand{\docversion}{$1} \input{BA-Dokumentation-Template.tex}"
pdflatex -interaction=nonstopmode -halt-on-error ./web-abstract/WebAbstract.tex
pdflatex -interaction=nonstopmode -halt-on-error ./web-abstract/WebAbstract.tex
