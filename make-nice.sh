#!/bin/bash

#--------------------------------------------------------------------------------
# Install dotfiles
#--------------------------------------------------------------------------------
echo "Copying dotfiles..."
for DOTFILE in .vimrc .profile .gitconfig .bash_sessions_disable .screenrc .pythonrc
do
	if [ ! -e ~/$DOTFILE ]
	then
        echo " - Installed $DOTFILE"
		cp $DOTFILE ~
	fi
  
#--------------------------------------------------------------------------------
# Install Homebrew
#--------------------------------------------------------------------------------

if ! which -s brew
then
    echo "Setting up Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#--------------------------------------------------------------------------------
# Install basic dependencies
#--------------------------------------------------------------------------------
echo "Install basic Homebrew packages..."
brew install python
brew install git bash-completion tmux
brew install libsndfile libsoundio portaudio sox audacity spotifyd ffmpeg

#--------------------------------------------------------------------------------
# Enable Brew Services
#--------------------------------------------------------------------------------

brew services start spotifyd

#--------------------------------------------------------------------------------
# Other Stuff I Never Use
#--------------------------------------------------------------------------------

git clone https://github.com/mattstauffer/ohmyzsh-dotfiles.git && sh ohmyzsh-dotfiles/bootstrap.sh
wget https://github.com/stashapp/stash/releases/download/latest_develop/stash-osx && chmod u+x stash-osx && tmux new-session -d -s stash '.stash-osx --port 9090'
