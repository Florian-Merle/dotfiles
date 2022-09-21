# Install

I recommend cloning this repository into `~/dotfiles` so the wallpaper image and the install guide work without any adjustment.

```sh
git clone git@github.com:Florian-Merle/dotfiles.git ~/dotfiles
```

## Zsh

```sh
sudo apt install zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install bat

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.oh-my-zsh/themes/agnoster-custom.zsh-theme ~/.oh-my-zsh/themes/agnoster-custom.zsh-theme
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

Used to search files more efficiently in Neovim.

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

## Regolith 2 config

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

# Installation on an X1 carbon

On my X1 carbon, I like to remap the print screen key to the context menu. This can be done following [this guide](https://askubuntu.com/a/1219481).

```
# /usr/share/X11/xkb/keycodes/evdev

default xkb_keycodes "evdev" {
    // ...

    // Custom
    alias <MENU> = <PRSC>;
};
```

I also like to invert the function and the ctrl keys, this can easily be done in the BIOS.

Finally, I like to remap the caps lock to escape. It's quite a pain in the ass to configure so I recommend installing Gnome tweaks and setting it through the GUI. See the following screenshot.

![Remap caps lock screenshot](images/caps_lock_remap_screenshot.png)

# Credits

Thanks to [@dizzyup](https://hector.me/) for his [Wavēy](https://hector.me/wavey) wallpaper collection.

# Todo

* Add a spell checker
* Add git stuff in nvim
* Improve zsh conf
* Add vim config
* Fix Alt+{hjkl} mappings in vim
* Write installation guide
