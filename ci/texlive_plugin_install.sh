#!/bin/bash
set -eo pipefail

tlmgr install koma-script etoolbox logreq biblatex-apa csquotes siunitx oberdiek tocloft abstract pdfpages enumitem
tlmgr install psnfss ms caption ec l3kernel l3packages zapfding symbol helvetic textpos glossaries xkeyval mfirstuc
tlmgr install textcase xfor datatool substr fp tracklang pdfx iftex xcolor xmpincl glossaries-german
tlmgr install bitset letltxmacro pdfescape pdflscape ragged2e lipsum
