################################################################################
# Oh My ZSH config
################################################################################

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
CASE_SENSITIVE="true"

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
plugins=(git brew rbenv gem rake npm grunt golang nyan lein git-annex nvm nix)

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
# export TERM="xterm-256color"

################################################################################
# Aliases
################################################################################

# General
alias ll="ls -halF"
alias processus='ps -e -o"pid ppid user ucomm"'
alias ls-executables="whence -pm '*'"
alias cp-follow-symlinks="cp -RL"
alias curl-response-status="curl -I"

# VLC
if [[ "$CURRENTOS" == "MACOS" ]]; then
  alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
fi
alias vlcc="vlc -I ncurses"

# Emacs
alias gemacs='emacsclient -c -n -a "" -F "((fullscreen . maximized))"'

# Radios
alias radio-france-inter="mplayer -playlist http://www.tv-radio.com/station/france_inter_mp3/france_inter_mp3-128k.m3u"
alias radio-france-culture="mplayer -playlist http://www.tv-radio.com/station/france_culture_mp3/france_culture_mp3-128k.m3u"
alias radio-france-info="mplayer -playlist http://audio.scdn.arkena.com/11006/franceinfo-midfi128.mp3"
alias radio-france-musique="mplayer -playlist http://www.tv-radio.com/station/france_musique_mp3/france_musique_mp3-128k.m3u"
alias radio-france-inter-vlc="vlcc http://www.tv-radio.com/station/france_inter_mp3/france_inter_mp3-128k.m3u"
alias radio-france-culture-vlc="vlcc http://www.tv-radio.com/station/france_culture_mp3/france_culture_mp3-128k.m3u"
alias radio-fip="mplayer http://mp3lg.tdf-cdn.com/fip/all/fiphautdebit.mp3"
alias radio-classique="mplayer http://broadcast.infomaniak.net/radioclassique-high.mp3"

# TMUX
alias tmux="tmux -2"

# youtube-dl
alias youtube-dl-best="youtube-dl --extract-audio --audio-format best --audio-quality 0"
alias youtube-dl-mp4="youtube-dl --format mp4 --max-quality mp4  --extract-audio --audio-format best --audio-quality 0"
alias youtube-dl-mp4-video="youtube-dl --format mp4 --max-quality mp4"
alias youtube-dl-formats="youtube-dl -F"
alias youtube-dl-free-video="youtube-dl --prefer-free-formats"

# Inkscape on Mac
if [[ "$CURRENTOS" == "MACOS" ]]; then
  alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"
fi

# Bundle
alias b="bundle exec"

# Thinkpad Trackpoint
if [[ "$CURRENTOS" == "LINUX" ]]; then
trackpoint=$(cat <<EOF
  xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1; \
  xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2; \
  xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200; \
  xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
EOF
)

alias enable-trackpoint=$trackpoint
fi

# MongoDB
if [[ "$CURRENTOS" == "MACOS" ]]; then
  alias mongod="mongod --config ~/dotfiles/mongod.conf"
fi

# tig
alias tigg="tig --all"

# Node.js
alias es6="node --harmony"

# PostgreSQL
alias postgres-start="postgres -D /usr/local/var/postgres"

# Git Annex
# alias ga="git annex"

# Docker
alias dc=docker-compose

################################################################################
# Per program
################################################################################

# Homebrew
if [[ "$CURRENTOS" == "MACOS" ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
fi

# NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && source ~/.nvm/nvm.sh

# Go
# if which go >/dev/null; then
# fi
if [[ ! -f ~/go ]]; then
  mkdir -p ~/go/bin
fi
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# OPAM
[[ -d ~/.opam ]] && PATH=$PATH:$HOME/.opam/system/bin

# Cabal
PATH=$PATH:$HOME/.cabal/bin

# Racket
if [[ -d /Applications/Racket\ v6.0/bin ]]; then
  export PATH="$PATH:/Applications/Racket v6.0/bin"
fi

# Nix Package Manager
if [[ "$CURRENTOS" == "MACOS" ]]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# z
if [[ "$CURRENTOS" == "MACOS" ]]; then
  source `brew --prefix`/etc/profile.d/z.sh
fi
if [[ "$CURRENTOS" == "LINUX" ]]; then
  source ~/code/github-non-dam/z/z.sh
fi


################################################################################
# Per computer
################################################################################

if [[ -s ~/.zshrc_specific ]]; then
  source ~/.zshrc_specific
fi

################################################################################
# RBenv
################################################################################

if [[ -d ~/.rbenv ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

################################################################################
# PATH
################################################################################

export PATH="$PATH:$HOME/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

################################################################################
# Completions
################################################################################

# Load brew zsh completions

if [[ "$CURRENTOS" == "MACOS" ]]; then
  fpath=(/usr/local/share/zsh/site-functions $fpath)
fi

autoload -Uz compinit
compinit -u

# OPAM configuration
. /Users/dam/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
