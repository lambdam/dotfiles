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
# Detect system
################################################################################

platform=`uname -s`
if [[ "$platform" == "Darwin" ]]; then
  CURRENTOS="MACOS"
elif [[ `expr substr $platform 1 5` == "Linux" ]]; then
  CURRENTOS="LINUX"
fi

################################################################################
# Exports
################################################################################

export EDITOR=vim
export TERM="xterm-256color"

################################################################################
# Aliases
################################################################################

# General
alias ll="ls -halF"
alias processus='ps -e -o"pid ppid user ucomm"'

# VLC
alias vlcc="vlc -I ncurses"

# Emacs
alias gemacs='emacsclient -c -n -a "" -F "((fullscreen . maximized))"'

# Radios
alias france-inter="mplayer -playlist http://www.tv-radio.com/station/france_inter_mp3/france_inter_mp3-128k.m3u"
alias france-culture="mplayer -playlist http://www.tv-radio.com/station/france_culture_mp3/france_culture_mp3-128k.m3u"
alias france-inter-vlc="vlcc http://www.tv-radio.com/station/france_inter_mp3/france_inter_mp3-128k.m3u"
alias france-culture-vlc="vlcc http://www.tv-radio.com/station/france_culture_mp3/france_culture_mp3-128k.m3u"

# TMUX
alias tmux="tmux -2"

# youtube-dl
alias youtube-dl-best="youtube-dl --extract-audio --audio-format best --audio-quality 0"
alias youtube-dl-mp4="youtube-dl --format mp4 --max-quality mp4  --extract-audio --audio-format best --audio-quality 0"

################################################################################
# Per program
################################################################################

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Homebrew
if [[ "$CURRENTOS" == "MACOS" ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
  source `brew --prefix`/etc/profile.d/z.sh
fi

# NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && source ~/.nvm/nvm.sh

# Go
if which go >/dev/null; then
  export GOPATH=~/dev/go/test
fi

# OPAM
[[ -d ~/.opam ]] && PATH=$PATH:$HOME/.opam/system/bin

# Cabal
# PATH=$PATH:$HOME/.cabal/bin

################################################################################
# Per computer
################################################################################

if [[ -s ~/.zshrc_specific ]]; then
  source ~/.zshrc_specific
fi
