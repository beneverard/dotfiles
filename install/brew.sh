#!/usr/bin/env bash

# Install command-line tools using Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
# brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
# brew install gnupg

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install PHP
tput bel
read -p "Install PHP? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	brew tap shivammathur/php
	brew install shivammathur/php/php@7.3
	brew install shivammathur/php/php@7.4
	brew install php@8.1
	brew link --force php@8.1
fi

# Install MySQL
tput bel
read -p "Install MySQL? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	brew install mysql
	brew services start mysql

	tput bel
	mysql_secure_installation
fi

# App development
brew install cocoapods

# Install other useful binaries.
brew install ack
brew install composer
brew install git
brew install git-lfs
brew install imagemagick
brew install lynx
brew install htop
brew install ssh-copy-id
brew install svgo
brew install tree
brew install yarn
brew install watch
brew install wp-cli
brew install mas

# sound a bell to alert of the prompt
tput bel

read -p "Do you wish to install brew casks? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then

	# Install latest app versions
	brew install --cask 1password
	brew install --cask alfred
	brew install --cask android-sdk
	brew install --cask android-studio
	brew install --cask appcleaner
	brew install --cask autodesk-fusion360
	brew install --cask cleanshot
	brew install --cask coconutbattery
	brew install --cask daisydisk
	brew install --cask dropbox
	brew install --cask fantastical
	brew install --cask figma
	brew install --cask firefox
	brew install --cask focus
	brew install --cask gas-mask
	brew install --cask google-chrome
	brew install --cask grammarly
	brew install --cask harvest
	brew install --cask imageoptim
	brew install --cask insomnia
	brew install --cask integrity
	brew install --cask iterm2
	brew install --cask loom
	brew install --cask notion
	brew install --cask openvpn-connect
	brew install --cask pocket-casts
	brew install --cask ray
	brew install --cask sequel-ace
	brew install --cask sketch
	brew install --cask slack
	brew install --cask spotify
	brew install --cask steam
	brew install --cask tableplus
	brew install --cask tower
	brew install --cask transmit
	brew install --cask tweetbot
	brew install --cask ultimaker-cura
	brew install --cask virtualbox
	brew install --cask visual-studio-code
	brew install --cask vlc
	brew install --cask whatsapp
	brew install --cask zoom

	# Specific taps
	brew tap nicoverbruggen/homebrew-cask
	brew install --cask phpmon
fi;

# sound a bell to alert of the prompt
tput bel

read -p "Do you wish to install apps from the Mac App Store? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	mas install 506189836 # Harvest
	mas install 1091189122 # Bear
	mas install 1415311616 # Countdowns
	mas install 1278508951 # Trello
	mas install 1233965871 # ScreenBrush
	mas install 568494494 # Pocket
	mas install 442168834 # SiteSucker
	mas install 1514915737 # Awesome Habits
	mas install 1384080005 # Tweetbot
	mas install 1176895641 # Spark
fi;

# Remove outdated versions from the cellar.
brew cleanup

# mysql setup
mysqld --initialize-insecure --user=mysql
