PACKAGES="\
aptitude \
autoconf \
bison \
build-essential \
curl \
chromium-browser \
emacs24 \
git \
gitg \
htop \
imagemagick \
libxslt1-dev \
libreadline6 \
libreadline6-dev \
libssl-dev \
libxml2-dev \
libxslt1-dev \
libyaml-dev \
nginx-full \
oracle-java7-installer \
redis-server \
silversearcher-ag \
terminator \
vim \
vlc \
xchat \
zlib1g \
zlib1g-dev \
zsh \
"

RUBY_VERSION="2.1.1"

NODE_VERSION="0.11.12"

##########

# PPA
sudo add-apt-repository ppa:webupd8team/java

# Refresh
sudo apt-get update
sudo apt-get upgrade

# Install all packages
sudo apt-get install $PACKAGES

# Ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install $RUBY_VERSION
rbenv rehash
rbenv global $RUBY_VERSION
gem install bundler

# VIM
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Node
git clone https://github.com/creationix/nvm.git ~/.nvm
source ~/.nvm/nvm.sh
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION
