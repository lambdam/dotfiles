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
# Per program
################################################################################

# Homebrew
if [[ "$CURRENTOS" == "MACOS" ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
  source `brew --prefix`/etc/profile.d/z.sh
fi
