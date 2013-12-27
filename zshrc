# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

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
plugins=(git brew rvm gem rake npm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

################################################################################
# Exports
################################################################################

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
# fi
# fpath=(/usr/local/share/zsh-completions $fpath)

export EDITOR=vim


################################################################################
# Aliases
################################################################################

# Commandes générales
alias ll="ls -halF"
alias processus='ps -e -o"pid ppid user ucomm"'
alias vlcc="vlc -I ncurses"

# Radios
alias france-inter="mplayer http://www.tv-radio.com/station/france_inter_mp3/france_inter_mp3-128k.m3u"
alias france-culture="mplayer http://www.tv-radio.com/station/france_culture_mp3/france_culture_mp3-128k.m3u"
alias france-inter-vlc="vlcc http://www.tv-radio.com/station/france_inter_mp3/france_inter_mp3-128k.m3u"
alias france-culture-vlc="vlcc http://www.tv-radio.com/station/france_culture_mp3/france_culture_mp3-128k.m3u"

################################################################################
# Modules
################################################################################

# NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && source ~/.nvm/nvm.sh

alias gitx="/Applications/GitX.app/Contents/MacOS/GitX"

source `brew --prefix`/etc/profile.d/z.sh

# Go
source ~/.shell-imports/go-completions/_go
export GOPATH=~/dev/go/test

# Canal
export CANAL_ENV=tnt
alias gd="grunt deploy"
alias gdo="grunt deploy:only"
alias gr="grunt restart"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# OPAM
PATH=$PATH:$HOME/.opam/system/bin

# TMUX
alias tmux="tmux -2"

# Cabal
PATH=$PATH:$HOME/.cabal/bin

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Emacs
alias gemacs='emacsclient -c -n -a "" -F "((fullscreen . maximized))"'

export TERM="xterm-256color"
