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
brew install php-code-sniffer
brew install ssh-copy-id
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
	brew install --cask autodesk-fusion
	brew install --cask backblaze
	brew install --cask cleanmymac
	brew install --cask cleanshot
	brew install --cask dropbox
	brew install --cask fantastical
	brew install --cask figma
	brew install --cask firefox
	brew install --cask firefox@developer-edition
	brew install --cask gas-mask
	brew install --cask google-chrome
	brew install --cask grammarly-desktop
	brew install --cask harvest
	brew install --cask imageoptim
	brew install --cask insomnia
	brew install --cask integrity
	brew install --cask iterm2
	brew install --cask loom
	brew install --cask notion
	brew install --cask openvpn-connect
	brew install --cask pocket-casts
	brew install --cask polypane
	brew install --cask ray
	brew install --cask rectangle-pro
	brew install --cask sequel-ace
	brew install --cask slack
	brew install --cask spotify
	brew install --cask tor-browser
	brew install --cask tower
	brew install --cask transmission
	brew install --cask transmit
	brew install --cask ultimaker-cura
	brew install --cask virtualbox
	brew install --cask visual-studio-code
	brew install --cask whatsapp
	brew install --cask zoom
fi;

# sound a bell to alert of the prompt
tput bel

read -p "Do you wish to install apps from the Mac App Store? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	mas install 506189836 # Harvest
	mas install 1278508951 # Trello
	mas install 1176895641 # Spark
	mas install 953286746 # Darkroom
	mas install 409203825 # Apple Numbers
	mas install 409201541 # Apple Pages
 	mas install 409183694 # Apple Keynote
	mas install 1569813296 # 1Password Safari
	mas install 1594420480 # Prompt3
	mas install 497799835 # Xcode
	mas install 1186159417 # TP-Link Deco
	mas install 1472718009 # TP-Link Tapo
fi;

# Remove outdated versions from the cellar.
brew cleanup
