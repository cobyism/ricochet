#!/bin/bash

echo ""
echo "WELCOME TO RICOCHET!"
echo ""

if [ ! command -v brew >/dev/null 2>&1 ] && [ ! command -v brew cask >/dev/null 2>&1 ]; then
  echo "Let’s get you set up first by running strap…"
  echo ""
  if [ ! -f ~/Downloads/strap.sh ]; then
    echo "It doesn’t look like you’ve downloaded strap.sh yet. Let me open that in a browser for you."
    open https://osx-strap.herokuapp.com/strap.sh
    echo "Run this again once you’ve got strap.sh in ~/Downloads :)"
  else
    echo "Running strap.sh…"
    echo ""
    source ~/Downloads/strap.sh
    echo ""
    echo "Successfully finished running strap. Now, onto the good stuff!"
    echo ""
  fi
else
  echo "Looks like this isn’t you’re first rodeo! Skipping straight to the good stuff."
  echo ""
fi

if ! command -v ansible-playbook >/dev/null 2>&1; then
  echo "Looks like we ain’t got any ansible yet. Let’s do something about that, aye?"
  echo ""
  brew install ansible
  echo "Ansibled up."
  echo ""
fi

echo "Running Ricochet…"
echo ""
export RICOCHET=/Users/cobyism/code/ricochet
$RICOCHET/bin/ricochet all

echo "Bing! All done :)"
