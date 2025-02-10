################################################################################
# Oh My ZSH config
################################################################################
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dam/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# git-annex
plugins=(git fzf docker podman virtualenv python uv)
# Add wisely, as too many plugins slow down shell startup.

# https://github.com/ohmyzsh/ohmyzsh/issues/11789
zstyle ':omz:plugins:docker' legacy-completion yes

source $ZSH/oh-my-zsh.sh

# User configuration

################################################################################
# Detect system
################################################################################
# export MANPATH="/usr/local/man:$MANPATH"

platform=`uname -s`
if [[ "$platform" == "Darwin" ]]; then
  CURRENTOS="MACOS"
elif [[ `expr substr $platform 1 5` == "Linux" ]]; then
  CURRENTOS="LINUX"
fi
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

################################################################################
# Exports
################################################################################

export EDITOR=nvim
# export TERM="xterm-256color"

################################################################################
# Aliases
################################################################################

# General
# alias ll="ls -halF"
alias ll="eza --long --icons=auto --all"
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
alias temacs="emacs --no-window-system"
alias doomemacs="emacs --with-profile doom"
alias temacsdoom="emacs --no-window-system --with-profile doom"

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

# Git TUI
alias tigg="tig --all"
alias gg="git-graph"
alias gi="gitui"

# Node.js
alias es6="node --harmony"

# PostgreSQL
alias postgres-start="postgres -D /usr/local/var/postgres"

# Git Annex
alias anx="git annex"

# Docker
alias dc=docker-compose

# Touchpad fix
alias touchpadFix='synclient Touchpadoff=0 ; synclient HorizTwoFingerScroll=1; synclient PalmDetect=1;'

# Neovide
alias nv=neovide
alias y=yazi

# bat
alias batt="bat --paging=always"

# nvim read only
alias v="nvim -R"

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

# OPAM configuration
# . /home/dam/.asdf/installs/ocaml/4.06.1/opam-init/init.zsh > /dev/null 2> /dev/null || true
test -r /home/dam/.opam/opam-init/init.zsh && . /home/dam/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


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

# asdf / mise
# source $HOME/.asdf/asdf.sh
# source $HOME/.asdf/completions/asdf.bash
eval "$(~/.local/bin/mise activate zsh)"


# Haskell stack
export PATH=$PATH:$HOME/.local/bin

# z jump around
# if [[ "$CURRENTOS" == "MACOS" ]]; then
#   source `brew --prefix`/etc/profile.d/z.sh
# fi
# if [[ "$CURRENTOS" == "LINUX" ]]; then
#   source ~/code/github/miscellaneous/z/z.sh
# fi
#
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Flutter
export CHROME_EXECUTABLE=$(which chromium) 

# Doom Emacs
export PATH="$HOME/.config/emacs/bin:$PATH"

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
export PATH="$PATH:$HOME/local/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Flatpak
export PATH="/var/lib/flatpak/exports/bin:$PATH"

################################################################################
# Completions
################################################################################

# Load brew zsh completions

if [[ "$CURRENTOS" == "MACOS" ]]; then
  fpath=(/usr/local/share/zsh/site-functions $fpath)
fi

autoload -Uz compinit
compinit -u

# source /home/dam/.config/broot/launcher/bash/br
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zoxide - https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

if [ -e /home/dam/.nix-profile/etc/profile.d/nix.sh ]; then . /home/dam/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
