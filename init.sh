#!/bin/bash

#---------------- ~/.config/nvim setup ----------------

git clone https://github.com/kevin3314/NeoVimConfig

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

if [ ! -d ~/.config/NeoVimConfig ]; then
  mv './NeoVimConfig' ~/.config/
fi

if [ ! -d ~/.config/nvim ]; then
  mv ~/.config/NeoVimConfig ~/.config/nvim
fi

if [ -d ~/.config/NeoVimConfig ]; then
  rm -r -f ~/.config/NeoVimConfig
fi

#(for Mac)
#---------------- pyenv setup ----------------
if [ "$(uname)" == 'Darwin' ]; then
  # When OS is Mac.
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # setup shell
  brew cask install iterm2
  chsh -s /usr/local/bin/zsh

  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  brew install neovim

  brew install pyenv

  brew install pyenv-virtualenv

  sudo installer -pkg '/Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg' -target /

  pyenv install '3.7.0'
  pyenv virtualenv '3.7.0' 'forVim'
  pyenv activate 'forVim'

  pip install 'autopep8'
  pip install 'black'
  pip install 'isort'
  pip install 'flake8'
  pip install 'pynvim'
  pip install 'jedi'

  chmod 775 ./dotfile.sh
  ./dotfile.sh

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  # When OS is Linux.
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv

  # for pyenv
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

  source ~/.zshrc

  # for virtualenv
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

  source ~/.zshrc

  pyenv install '3.7.0'
  pyenv virtualenv '3.7.0' 'forVim'
  pyenv activate 'forVim'

  pip install 'autopep8'
  pip install 'black'
  pip install 'isort'
  pip install 'flake8'
  pip install 'pynvim'
  pip install 'jedi'

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
