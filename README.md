# Ricochet

An experiment in automating my laptop’s setup with [Ansible](http://docs.ansible.com/).

Things that this includes:

- [Homebrew](./packages/brews.yml) packages.
- [Cask](./packages/casks.yml) applications.
- Automated [file organisation](./dotfiles/.maid/rules.rb) with [maid](https://github.com/benjaminoakes/maid).
- Installation of my [dotfiles](./dotfiles).
- Organising my [shell environment](./zsh).
- Installing some [fonts](./packages/fonts.yml) I like to use.
- Ensuring a few [RubyGems](./packages/gems.yml) and [NPM](./packages/npms.yml) packages I use are installed.
- Installing config files and preferences for [miscellaneous apps](./resources).
- Configuration of [OS X default settings](./packages/osx.yml).

Basically, the goal is to automate as much of my computer’s setup as possible.

## Bootstrapping

Run the following command in a terminal.

```sh
curl https://raw.githubusercontent.com/cobyism/ricochet/master/bootstrap.sh | sh
```

This will:

- Clone Ricochet into `~/code/ricochet`.
- Run [strap](https://github.com/mikemcquaid/strap), to get the following installed:
  - Xcode command line tools, xcode license agreed to, etc.
  - Homebrew, as well as the `brew bundle` command, Caskroom, and other niceties.
  - Miscellaneous OS X stuff (ensuring filevault is on, disabling java in Safari, fetch software updates etc.)
- Install Ansible, which this project uses to do stuff.
- Run Ricochet for the first time, putting everything in place.

![](https://cloud.githubusercontent.com/assets/296432/9832693/d0c44baa-597a-11e5-80af-6a72ada12c90.png)

## Ongoing usage

Run the following command to ensure everything is set up as it should be.

```sh
ricochet all
```

Once ricochet has been pulled down and run once, you can just refresh various
aspects of your setup as you add stuff to the lists:

- `ricochet apps` will fetch all homebrew/cask packages and fonts.
- `ricochet dev` will install all gems and npm packages.
- `ricochet dotfiles` will ensure all dotfiles are symlinked into `~`.
- `ricochet setup` will configure osx defaults, maid automation, and misc app preferences.
- etc.

## Notes

Some things to be aware of:

- Removing things from a list won’t remove it from your system.
- This could mess your system up horribly. Use at your own peril.

## License

[MIT](./LICENSE), so go :nut_and_bolt:s.
