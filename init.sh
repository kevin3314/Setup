#!/bin/bash

#(for Mac)
#---------------- pyenv setup ----------------
if [ "$(uname)" == 'Darwin' ]; then
  chsh -s /usr/local/bin/zsh
  # When OS is Mac.
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  git clone --recursive git@github.com:kevin3314/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  # setup shell
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew cask install iterm2
  brew cask install alfred
  brew install neovim
  brew install pyenv

  chmod 775 ./dotfile.sh
  ./dotfile.sh

  cp Ricty\ Regular\ Nerd\ Font\ Plus\ Font\ Awesome\ Plus\ Octicons\ Plus\ Pomicons\ Plus\ Font\ Logos\ \(Font\ Linux\).ttf ~/Library/Fonts/
  brew install peco
  brew install percol
  git clone git@github.com:kevin3314/anyframe.git ~/anyframe

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  # setup zsh
  chsh -s /usr/local/bin/zsh
  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # When OS is Linux.
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv

  # for pyenv
  # echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  # echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  # echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

  source ~/.zshrc

  # for virtualenv
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
  # echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

  source ~/.zshrc

  chmod 775 ./dotfile.sh
  ./dotfile.sh

fi

#---------------- rbenv setup ----------------

#brew install rbenv
#brew install postgresql
#brew install yarn
#echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
#echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
#brew install ruby-build
#brew install rbenv-gemset
#brew install rbenv-gem-rehash

#rbenv install '2.5.0'
#rbenv rehash
#rbenv global '2.5.0'
#gem install bundler
