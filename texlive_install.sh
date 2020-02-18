#!/bin/bash

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=/tmp/texlive.profile
  cd ..
fi

# Check if Biber-contribute repository is already loaded
if tlmgr repository list | grep --quiet http://contrib.texlive.info/current; then
  echo "Contrib already exists"
else
  tlmgr repository add http://contrib.texlive.info/current tlcontrib
  tlmgr pinning add tlcontrib "*"
  curl -fsSL https://www.preining.info/rsa.asc | tlmgr key add -
fi

# install biber & biblatex
tlmgr install biber
tlmgr install biblatex

# A kind of minimum set of packages needed
tlmgr install collection-latex

# Install european babel languages
tlmgr install collection-langeuropean
tlmgr install babel-german
tlmgr install hyphen-german

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
