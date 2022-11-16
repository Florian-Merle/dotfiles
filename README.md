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
ln -sf ~/dotfiles/phpactor ~/.config/phpactor
```

Lsp logs

```sh
tail /home/florian/.local/state/nvim/lsp.log
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
ln -s ~/dotfiles/regolith2/i3/config.d ~/.config/regolith2/i3/
ln -s ~/dotfiles/regolith2/i3xrocks/conf.d ~/.config/regolith2/i3xrocks/
```

Status bar configuration

```sh
$ ls -l /usr/share/i3xrocks/conf.d
01_setup
70_rofication
80_time
90_battery
```

## Notifications

```
# Disable network notifications
gsettings set org.gnome.nm-applet disable-disconnected-notifications "true"
gsettings set org.gnome.nm-applet disable-connected-notifications "true"
```


# Installation on an X1 carbon

## Remap Print Screen with Context menu

On my X1 carbon, I like to remap the print screen key to the context menu. This can be done following [this guide](https://askubuntu.com/a/1219481).

```
# /usr/share/X11/xkb/keycodes/evdev

default xkb_keycodes "evdev" {
    // ...

    // Custom
    alias <MENU> = <PRSC>;
};
```

## Swapping Ctrl with Function

I also like to invert the function and the ctrl keys, this can easily be done in the BIOS.

## Swapping Caps Lock with Escape

1. `sudo apt install dconf-tools`
2. `dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"`

Alternatively, you can use the `dconf-editor` GUI once DConf tools are installed.

> Use `caps:escape` instead if you want to just set Caps Lock to Escape instead
> of swapping the functionality of the keys.

Credit to [@zanbaldwin](https://github.com/zanbaldwin/dotfiles/blob/main/README.md#swapping-caps-lock-with-escape)

# Credits

Thanks to [@dizzyup](https://hector.me/) for his [Wavēy](https://hector.me/wavey) wallpaper collection.

# Misc

Use key notation to know what a key does.

```
:help key-notation
```

# Todo

* Add git stuff in nvim
* Improve zsh conf
* Fix Alt+{hjkl} mappings in vim
* Write installation guide
* :set filetype=html
