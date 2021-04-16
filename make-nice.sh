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
brew install git bash-completion
brew install libsndfile libsoundio portaudio sox audacity spotifyd 

#--------------------------------------------------------------------------------
# Enable Brew Services
#--------------------------------------------------------------------------------

brew services start spotifyd
