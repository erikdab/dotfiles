#!/usr/bin/env
# Perform layer installation and customization here if not yet
# CLI Programs
REPOS+=("ppa:neovim-ppa/stable")
PKGS=$PKGS" zsh git gawk curl xsel neovim"

# neovim Python dependencies
PKGS=$PKGS" python-dev python-pip python3-dev python3-pip"

# Add ZRAM to create super fast swap for ML, etc.
PKGS=$PKGS" zram-config"

REPOS+=("ppa:kelleyk/emacs");
PKGS=$PKGS" emacs26"

# GUI Programs
PKGS=$PKGS" zathura zathura-ps tilix conky python-nautilus firefox"

# Publishing
PKGS=$PKGS" texlive-latex-base texlive-latex-recommended texlive-latex-extra python-pygments pandoc"

PKGS=$PKGS" exfat-fuse exfat-utils"

# pdftk
REPOS+=("ppa:malteworld/ppa")
PKGS=$PKGS" pdftk"

PKGS_RM="evolution ksh"
installall

# Remove texlive docs
if [ ! -z "$(dpkg -l | awk '{print $2}' | grep '^texlive.*-doc')" ]; then
	  sudo apt-get --purge remove -y ^texlive.\*-doc$
fi

# pdftk
REPOS+=("ppa:malteworld/ppa")
PKGS=$PKGS" pdftk"

# FLATS+=(" https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref")
