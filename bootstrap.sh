#!/bin/bash

brew install ansible
export RICOCHET=/Users/cobyism/code/ricochet
./bin/ricochet brews
./bin/ricochet casks
./bin/ricochet all
