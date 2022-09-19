# Install

## Aliases

```sh
todo
```

## Phpactor

```sh
# phpactor binary
cd ~/.local/share
git clone git@github.com:phpactor/phpactor.git
composer i
cd /usr/local/bin
ln -s ~/.local/share/phpactor/bin/phpactor phpactor

# phpactor configuration
ln -s ~/dotfiles/phpactor.json  ~/.config/phpactor/phpactor.json
```

## fzf

```sh
sudo apt-get install fzf
```

## Tmux Gruvbox theme

```sh
cd ~
git clone git@github.com:egel/tmux-gruvbox.git
```

## Gnome terminal profile

```sh
# Create profile
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf

# Install profile
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
```

See https://unix.stackexchange.com/a/456356

## regolith2 config

Global configuration

```sh
ln -s ~/dotfiles/regolith2/Xresources ~/.config/regolith2/Xresources
```

Status bar configuration

```sh
$ ls -l /usr/share/i3xrocks/conf.d
01_setup
70_rofication
80_time
90_battery
```

# Todo

* Add regolith config
* Add a spell checker
* Make cursor centered
* Add git stuff in nvim
* Add zsh conf
* Add vim config
* Fix Alt+{hjkl} mappings in vim
* Write installation guide
