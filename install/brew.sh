#!/usr/bin/env bash

# sound a bell to alert of the prompt
tput bel

read -p "Do you want to install brew? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then

	# Install command-line tools using Homebrew.
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

fi;

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
brew install gnu-sed --with-default-names
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
brew install php@7.3
brew install php@7.8
brew install php@8.1
brew install mysql@5.7
brew install gmp

# Link PHP and MySQL
brew link --force php@8.1
brew link --force mysql@5.7

# App development
brew install cocoapods

# Install other useful binaries.
brew install ack
brew install composer
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lynx
brew install htop
brew install ssh-copy-id
brew install svgo
brew install tree
brew install yarn
brew install watch
brew install wp-cli

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
	brew install --cask appcleaner\
	brew install --cask coconutbattery
	brew install --cask fantastical
	brew install --cask figma
	brew install --cask firefox
	brew install --cask focus
	brew install --cask gas-mask
	brew install --cask google-chrome
	brew install --cask grammarly
	brew install --cask harvest
	brew install --cask hyperdock
	brew install --cask imageoptim
	brew install --cask insomnia
	brew install --cask integrity
	brew install --cask iterm2
	brew install --cask notion
	brew install --cask pocket-casts
	brew install --cask sequel-pro
	brew install --cask sketch
	brew install --cask sketchup
	brew install --cask slack
	brew install --cask spotify
	brew install --cask steam
	brew install --cask tower
	brew install --cask transmit
	brew install --cask visual-studio-code
	brew install --cask whatsapp
	brew install --cask zoom
	brew install --cask cleanshot
	brew install --cask daisydisk
	brew install --cask dropbox
	brew install --cask openvpn-connect
	brew install --cask tableplus
	brew install --cask tweetbot
	brew install --cask ultimaker-cura
	brew install --cask virtualbox
	brew install --cask vlc

	# Specific taps
	brew tap nicoverbruggen/homebrew-cask
	brew install --cask phpmon

	# The following apps are not available as casks:
	# bear
	# countdowns
	# littleipsum
	# papperazi
	# pocket
	# screenbrush
	# sitesucker
	# things
	# trello

fi;

# Remove outdated versions from the cellar.
brew cleanup

# mysql setup
mysqld --initialize-insecure --user=mysql
