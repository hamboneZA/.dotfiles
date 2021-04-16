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
brew install git bash-completion tmux ruby
brew install libsndfile libsoundio portaudio sox audacity spotifyd ffmpeg

#--------------------------------------------------------------------------------
# Enable Brew Services
#--------------------------------------------------------------------------------

brew services start spotifyd

#--------------------------------------------------------------------------------
# Other Stuff I Never Use
#--------------------------------------------------------------------------------

git clone https://github.com/mattstauffer/ohmyzsh-dotfiles.git && sh ohmyzsh-dotfiles/bootstrap.sh
wget https://github.com/hamboneZA/t.git && cd t %% gem install t cd /
wget https://github.com/stashapp/stash/releases/download/latest_develop/stash-osx && chmod u+x stash-osx && tmux new-session -d -s stash '.stash-osx --port 9090'

#--------------------------------------------------------------------------------
# Media Scrapers
#--------------------------------------------------------------------------------
echo "Install media scrapers..."
mkdir scrape && cd $_
git remote add origin https://github.com/hamboneZA/youtube-dl.git
git branch -M main
git push -u origin main

echo "TODO: t authorize"
