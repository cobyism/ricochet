#!/bin/bash

echo ""
echo "██████╗ ██╗ ██████╗ ██████╗  ██████╗██╗  ██╗███████╗████████╗";
echo "██╔══██╗██║██╔════╝██╔═══██╗██╔════╝██║  ██║██╔════╝╚══██╔══╝";
echo "██████╔╝██║██║     ██║   ██║██║     ███████║█████╗     ██║   ";
echo "██╔══██╗██║██║     ██║   ██║██║     ██╔══██║██╔══╝     ██║   ";
echo "██║  ██║██║╚██████╗╚██████╔╝╚██████╗██║  ██║███████╗   ██║   ";
echo "╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ";
echo ""

export WHOAMI=`whoami`
export RICOCHET="/Users/$WHOAMI/code/ricochet"

abort() { echo "!!! $@" >&2; exit 1; }
log()   { echo "--> $@"; }
logn()  { echo "--> $@ "; echo ""; }
logk()  { echo "OK"; }

logn "Welcome to Ricochet!"

#
# Cloning / updating the Ricochet repository.
#

if [[ ! -d $RICOCHET ]]; then
  logn "Hooking you up with an Ricochet in $RICOCHET…"
  git clone https://github.com/cobyism/ricochet $RICOCHET
else
  logn "Looks like you’ve already got Ricochet cloned. Attempting to update it…"
  pushd $RICOCHET >/dev/null
  git pull
  popd >/dev/null
  logn "I sure hope that worked… ¯\_(ツ)_/¯"
fi

#
# Running Strap (https://github.com/mikemcquaid/strap).
#

if [ ! command -v brew >/dev/null 2>&1 ] && [ ! command -v brew cask >/dev/null 2>&1 ]; then
  logn "Let’s get you set up first by running strap…"
  if [ ! -f ~/Downloads/strap.sh ]; then
    logn "It doesn’t look like you’ve downloaded strap.sh yet. Let me open that in a browser for you."
    open https://osx-strap.herokuapp.com/strap.sh
    abort "Run this again once you’ve got strap.sh in ~/Downloads :)"
  else
    logn "Running strap.sh…"
    source ~/Downloads/strap.sh
    logn "Removing strap-created .gitconfig, because we get it via Ricochet"
    rm ~/.gitconfig
    logn "Successfully finished running strap. Now, onto the good stuff!"
  fi
else
  logn "Looks like this isn’t you’re first rodeo! Skipping straight to the good stuff."
fi

#
# Ensuring Ansible is installed.
#

if ! command -v ansible-playbook >/dev/null 2>&1; then
  logn "Looks like we ain’t got any ansible yet. Let’s do something about that, aye?"
  brew install ansible
  logn "Ansibled up."
fi

#
# Running Ricochet for the first time.
#

logn "Running Ricochet…"
$RICOCHET/bin/ricochet all

logn "Bing! All done :)"
