# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew rvm rails rails3 rake npm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
# fi
# fpath=(/usr/local/share/zsh-completions $fpath)


# Commandes générales
alias ll="ls -halF"
alias ramdamdam="ssh root@37.26.241.6"
alias processus='ps -e -o"pid ppid user ucomm"'
export EDITOR=vim

# Sublime Text 2
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

# aeruti
# alias aeruti="cd /Volumes/aeruti"
# alias doctrine-mongodb-generate-documents-administrateur="php ./app/console doctrine:mongodb:generate:documents ArtisticartAdministrateurBundle"
# alias ccsf="rm -rf /Volumes/aeruti/app/cache/*"
# alias assets_aeruti_watch="php ./app/console assetic:dump --watch"
# alias assets_aeruti_prod="php ./app/console assetic:dump --env=prod --no-debug"
# alias assets_aeruti_dev="php ./app/console assetic:dump --env=dev"


# Web2py Osakasalon
# alias w2p="cd /Users/damienragoucy/Documents/Informatique/Web/web2py/osakasalon.web2py;python web2py.py"
# alias w2p_dossier="cd /Users/damienragoucy/Documents/Informatique/Web/web2py/osakasalon.web2py"


# Nginx
#alias nginx_stop="pidof nginx | xargs kill"
#alias nginx_restart="pidof nginx | xargs kill;nginx"
alias nginx_stop="nginx -s quit"
alias nginx_restart="nginx -s quit;nginx"
alias is-nginx-running="processus | grep nginx"

# sf2
# alias sf2="cd /Users/damienragoucy/Documents/Informatique/Web/Symfony2/sf2"
# alias sf2_cc="rm -rf /Users/damienragoucy/Documents/Informatique/Web/Symfony2/sf2/site.osakasalon.com-app/cache/*;rm -rf /Users/damienragoucy/Documents/Informatique/Web/Symfony2/sf2/site.ramdamdam.fr-app/cache/*"

# Node.js
#export NODE_PATH='/usr/local/lib/node_modules'
#export PATH="/usr/local/share/npm/bin:$PATH"

# Tests PHP
# alias testsPHP_dossier="cd /Users/damienragoucy/Documents/Informatique/Web/Nginx/NginxDocs/testsPHP"

# Rails Ramdamdam
# alias ramdamdam_rails="cd /Users/damienragoucy/Documents/Informatique/Web/Rails/ramdamdam"

# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
#export PATH
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.5

#AF83
# alias repertoire-AF83="cd /Users/damienragoucy/Documents/AF83"


# Colorisation
# export CLICOLOR=1
# export LSCOLORS=ExFxCxDxBxegedabagacad

# Alias GIT
# source ~/.shell-imports/git-completion.sh
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
# export PS1='\[\033[0;37m\]\u@\h:\[\033[0;33m\]\W\[\033[0m\]\[\033[1;32m\]$(__git_ps1)\[\033[0m\] \$ '
# alias gco='git co'
# alias gci='git ci'
# alias grb='git rb'
# alias gst="git status"
# alias glog="git log"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NVM
source ~/.nvm/nvm.sh
# [[ -r $NVM_DIR/nvm.sh ]] && . $NVM_DIR/nvm.sh
source ~/.nvm/bash_completion

alias gitx="/Applications/GitX.app/Contents/MacOS/GitX"

source `brew --prefix`/etc/profile.d/z.sh

# Go
source ~/.shell-imports/go-completions/_go
export GOPATH=~/dev/go/test

# Canal
export CANAL_ENV=tnt
alias gd="grunt deploy"
alias gr="grunt restart"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# OPAM
PATH=$PATH:$HOME/.opam/system/bin

# TMUX
alias tmux="tmux -2"

# Cabal
PATH=$PATH:$HOME/.cabal/bin
