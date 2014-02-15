#! /usr/bin/env sh

cd $(dirname "$0")

TASKS_DIR=$(pwd)

DOTFILES_DIR=$(dirname "$TASKS_DIR")

function create_link {
  home_path="$HOME/.$1"
  dotfiles_path="$DOTFILES_DIR/$1"

  if [[ -h $home_path || -f $home_path ]]; then
    rm $home_path
  fi

  ln -s $dotfiles_path $home_path
}

# Link zshrc


# Link gitconfig
create_link "gitconfig"
# Link gitignore_global
create_link "gitignore_global"

# Link vimrc
create_link "vimrc"
# Link gvimrc
create_link "gvimrc"
# Install neobundle if not present

# Create emacs.d folder if not present
if [[ ! -d ~/.emacs.d ]] ; then mkdir ~/.emacs.d ; fi
# Link init.el
create_link "emacs.d/init.el"
# Link custom.el
create_link "emacs.d/custom.el"

# Link iex (Elixir) file
create_link "iex"
