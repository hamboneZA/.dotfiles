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
git clone https://github.com/hamboneZA/youtube-dl.git cd /

#--------------------------------------------------------------------------------
# ELP
#--------------------------------------------------------------------------------

mkdir elp && cd $_
git clone origin https://github.com/hamboneZA/elearning-pro-moodle-panel.git

#--------------------------------------------------------------------------------
# MOODLE
#--------------------------------------------------------------------------------
git clone git://git.moodle.org/moodle.git
cd moodle
git branch -a
git branch --track MOODLE_310_STABLE origin/MOODLE_310_STABLE
git checkout MOODLE_310_STABLE cd


#--------------------------------------------------------------------------------
# END ZONE
#--------------------------------------------------------------------------------

echo "TODO: t authorize"
set -- $(locale LC_MESSAGES)
yesptrn="$1"; noptrn="$2"; yesword="$3"; noword="$4"

while true; do
    read -p "Readt to authorize Twitter (${yesword} / ${noword})? " yn
    if [[ "$yn" =~ $yesexpr ]]; then t authorize; exit; fi
    if [[ "$yn" =~ $noexpr ]]; then exit; fi
    echo "Answer ${yesword} / ${noword}."
done






