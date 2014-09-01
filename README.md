# Ricochet

An experiment in automating my laptop’s setup with [Ansible](http://docs.ansible.com/).

Things that this includes:

- [Homebrew](http://brew.sh/) packages.
- [Homebrew Cask](http://caskroom.io/) applications.
- Automated [file organisation](./dotfiles/.maid/rules.rb) with [maid](https://github.com/benjaminoakes/maid).
- Installation of my [dotfiles](./dotfiles).
- Organising my [shell environment](./zsh).
- Installing some [fonts](./packages/fonts.yml) I like to use.
- Ensuring a few [RubyGems](./packages/gems.yml) and [NPM](./packages/npms.yml) packages I use are installed.
- Installing config files and preferences for [miscellaneous apps](./resources).
- Configuration of [OS X default settings](./packages/osx.yml).

Basically, the goal is to automate as much of my computer’s setup as possible.

## Bootstrapping

I haven’t had to bootstrap a laptop from scratch yet, but I hope to test it out soon.
I work for [GitHub](https://github.com), and we’re heavy users of
[Boxen](https://boxen.github.com/), which was developed in-house and automates a
large portion of setting up developer’s laptops.

Things that’d probably be required:

- Installing XCode command-line tools.
- Installing Homebrew.
- Installing `rbenv`, `ruby-build`, and seeding ruby versions.
- Setting `zsh` as default shell.
- Installing ansible (via homebrew).

If you don’t have any of those things, then shit is probably going to break
if you attempt to use this without customizing it for your scenario.

## Usage

The first time you run this, you’ll probably want to do the following:

```sh
git clone https://github.com/cobyism/ricochet ~/code/ricochet
cd ~/code/ricochet
./ricochet all
```

Once ricochet has been pulled down and run once, you can just refresh various
aspects of your setup as you add stuff to the lists:

- `./ricochet apps` will fetch all homebrew/cask packages and fonts.
- `./ricochet dev` will install all gems and npm packages.
- `./ricochet dotfiles` will ensure all dotfiles are symlinked into `~`.
- `./ricochet setup` will configure osx defaults, maid automation, and misc app preferences.

## Notes

Some things to be aware of:

- Removing things from a list won’t remove it from your system.
- This could mess your system up horribly. Use at your own peril.

## License

[MIT](./LICENSE), so go :nut_and_bolt:s.
