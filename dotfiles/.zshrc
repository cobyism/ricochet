# Shortcut to this repo.
export RICOCHET=$HOME/code/ricochet

# source every .zsh file in this repo
for config_file ($RICOCHET/zsh/**/*.zsh) source $config_file

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Initialize nodenv
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# Initialize rbenv
eval "$(rbenv init -)"
