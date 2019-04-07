#!/usr/bin/env bash

# Install command-line tools using Homebrew.

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
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
# brew install gnupg

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen
brew install php@7.1
brew install mysql@5.7
brew install gmp

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install ssh-copy-id
brew install tree
brew install htop

# Install applications
brew cask install 1password
brew cask install alfred
brew cask install appcleaner
brew cask install atom
brew cask install basecamp
brew cask install cloudapp
brew cask install fantastical
brew cask install figma
brew cask install firefox
brew cask install focus
brew cask install gas-mask
brew cask install google-chrome-beta
brew cask install google-drive-file-stream
brew cask install grammarly
brew cask install imageoptime
brew cask install insomina
brew cask install integrity
brew cask install iterm2
brew cask install mailspring
brew cask install memory-tracker-by-timely
brew cask install notion
brew cask install pocket-casts
brew cask install rocket
brew cask install sequel-pro
brew cask install sketch
brew cask install sketchup
brew cask install slack
brew cask install snappy
brew cask install spotify
brew cask install steam
brew cask install timely
brew cask install tower
brew cask install transmit
brew cask install tripmode
brew cask install whatsapp
brew cask install zoom

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

# Remove outdated versions from the cellar.
brew cleanup

# mysql setup
mysqld --initialize-insecure --user=mysql
