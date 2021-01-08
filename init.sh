#!/usr/bin/env bash

if ! which brew
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

read -r -s -p "[sudo] sudo password for $(whoami):" pass

if ! which nvm
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install 10
fi

if ! wihch rvm
then
  gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash -s stable
  source ~/.rvm/scripts/rvm
  rvm install 2.4.3
fi

brew bundle --file=./init.Brewfile

ln -s /Applications/SourceTree.app/Contents/Resources/stree /usr/local/bin/

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
