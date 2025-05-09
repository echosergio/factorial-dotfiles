#!/bin/bash

~/bin/chezmoi init

pushd ~/.local/share/chezmoi
  git remote add origin $SUPERVISOR_DOTFILE_REPO
  git branch -M main
  git pull origin main
popd

~/bin/chezmoi apply

source ~/.bashrc

# Install packer dependencies
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' & disown
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' & disown # Yep, twice
nvim --headless -c 'TSUpdateSync' & disown

# Custom Git Environment Variables
export GIT_COMMITTER_NAME="Sergio Vicente de las Heras"
export GIT_COMMITTER_EMAIL="6536180+echosergio@users.noreply.github.com"
export GIT_AUTHOR_NAME="Sergio Vicente de las Heras"
export GIT_AUTHOR_EMAIL="6536180+echosergio@users.noreply.github.com"