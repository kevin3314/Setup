DOTFILES=$(pwd)
now=$(date '+%Y%m%d%H%M%S')

cd ~/

function copy_file() {
  if [[ -e $1 ]]; then
    mv $1 $1_$now
  fi
  ln -fs $DOTFILES/$1
}

copy_file '.zshrc'
