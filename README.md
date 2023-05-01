# Install

I recommend cloning this repository into `~/dotfiles` so the wallpaper image and the install guide work without any adjustment.

```sh
git clone git@github.com:Florian-Merle/dotfiles.git ~/dotfiles
```

## Zsh

```sh
sudo apt install zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.oh-my-zsh/themes/agnoster-custom.zsh-theme ~/.oh-my-zsh/themes/agnoster-custom.zsh-theme
```

## Tools

### fzf

Used to search files more efficiently in Neovim and do so fuzzy finding magic 🪄

```sh
sudo apt-get install fzf
```

### xsel

Used to forward stuff in the clipboard

```sh
sudo apt-get install xsel
```

### bat

Basically cat with syntax sighlighting.

```sh
sudo apt install bat
```

### delta

Used to have fancy git diffs.

In order to always have syntax highlight for PHP (even chunks without an opening php tag `<?php`) [the following workaround](https://github.com/dandavison/delta/issues/162#issuecomment-625952288) should be applied.

Also, make sure both bat and delta versions are compatible (mainly because from what I understand, delta reads bat cache, but bat cache structure can evolve). I found that bat v0.19.0 (the version I currently have installed) works with delta v0.12.1.

To sum up, you can download delta from [its repository](https://github.com/dandavison/delta), then build bat cache and finally create a symlink for the `~/.config/bat/syntaxes/PHP.sublime-syntax` file.

```sh
wget https://github.com/dandavison/delta/releases/download/0.12.1/git-delta_0.12.1_amd64.deb
dpkg -i git-delta_0.12.1_amd64.deb
rm git-delta_0.12.1_amd64.deb

bat cache --build

ln -s ~/dotfiles/bat/syntaxes/PHP.sublime-syntax ~/.config/bat/syntaxes/PHP.sublime-syntax
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

## Psalm

Just like phpactor, psalm can be used as a lsp.

```sh
composer global require vimeo/psalm:5.0.0-beta1
sudo ln -s ~/.config/composer/vendor/bin/psalm  /usr/local/bin/psalm
```

## Gnome terminal profile

```sh
# Create profile
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf

# Install profile
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
```

See https://unix.stackexchange.com/a/456356

Note that the color theme I use are downloaded with [Gogh](https://github.com/Gogh-Co/Gogh)

## Regolith 2 config

Global configuration

```sh
ln -s ~/dotfiles/regolith2/Xresources ~/.config/regolith2/Xresources
ln -s ~/dotfiles/regolith2/i3/config.d ~/.config/regolith2/i3/
ln -s ~/dotfiles/regolith2/i3xrocks/conf.d ~/.config/regolith2/i3xrocks/
```

### Catppuccin

Clone https://github.com/catppuccin/regolith

Then

```sh
# Install the regolith look
./install.sh
sudo python3 /usr/share/regolith-look/catppuccin/theme-switcher.py latte sky

# Install GTK flavored catppuccin
cd gtk && ./install.sh
```

Then using Gnome Tweaks, you can set the theme to Catppuccin Latte.

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

## External keyboard

My keyboard is a Ducky Channel one 2 tkl (DKON1887), see [the manual](https://mechanicalkeyboards.com/manuals/Ducky_One2_FullTKL_manual.pdf) and [this guide](https://gist.github.com/schmich/47819eac9cafed14d3bfe2195ea222be) to define them.

I currenlty have the following macros.

| Macro | Action |
| - | - |
| `Fn + ^` | Volume down |
| `Fn + $` | Volume up |

# Credits

* Thanks to [@dizzyup](https://hector.me/) for his [Wavēy](https://hector.me/wavey) wallpaper collection.
* New wallpaper misty_mountains taken from [here](https://gitlab.com/dochi77/arch-rices/-/blob/main/nord/wallpapers/misty_mountains.jpg).

# Misc

```
# Use key notation to know what does a key do in vim
:help key-notation
```

```
# Use to find an i3 key name see https://www.reddit.com/r/i3wm/comments/4e65g8/comment/d1xccjb/?utm_source=share&utm_medium=web2x&context=3
xev -event keyboard
```

# Spotify

## Theming

In order to theme Spotify, I used Spicetify. For more info, see the [following guide](https://www.omgubuntu.co.uk/2022/01/spicetify-change-spotify-app-theme).
Use [the advanced installation guide](https://spicetify.app/docs/advanced-usage/installation/#note-for-linux-users) in order to setup the correct permissions on Spotify files.

```bash
git clone https://github.com/morpheusthewhite/spicetify-themes.git
cd spicetify-themes
cp -r * ~/.config/spicetify/Themes

spicetify config current_theme "Ziro"
spicetify config color_scheme "green-light"
spicetify apply
```

## Notifications

In order to get rid of notifications, [see the following guide](https://askubuntu.com/a/472329).

# Trackpad 

## Magic Trackpad

When at home, I like to use an Apple Magic Trackpad, but unlike the laptop Trackpad, I prefer the middle click to be triggered with two finger instead of being aera based.

### xinput

In order to achieve this, the following command can be run whenever the trackpad is plugged in.
`XX` being the id of the trackpad (this can be found with `xinput list`), `YYY` being the number of the property and `Z, Z, Z` being the value for the property (this can, be found with `xinpuit list-props XX`).

```sh
xinput set-prop XX YYY Z, Z, Z
xinput set-prop 23 345 0, 1
```

### Running the script automatically

To automatically run the script when the trackpad is connected, I used udev with systemd. Systemd ensure the script is run by the user (not root).

#### systemd

```sh
# install
mkdir -p ~/.config/systemd/user
ln -s ~/dotfiles/systemd/user/connect-trackpad.service ~/.config/systemd/user/connect-trackpad.service
systemctl --user enable connect-trackpad.service
systemctl --user daemon-reload

# testing
systemctl --user start connect-trackpad.service

# when changing the service, you can disable it and re-enable it to apply changes
systemctl --user disable connect-trackpad.service
systemctl --user enable connect-trackpad.service

# monitor the service
journalctl --user -fu connect-trackpad
```
#### udev

Udev works with rules. 

```sh
# install
sudo ln -s ~/dotfiles/scripts/90-connect-trackpad.rules /etc/udev/rules.d/90-connect-trackpad.rules

sudo udevadm control --reload
sudo udevadm trigger
```

To build the rule, use the following command to find the relevent udev event.

```sh
udevadm monitor --environment
```

Then using the `DEVPATH`, use the following command to find attributes (please note, that the path is prefixed by `/sys`). `--attribute-walk` find every attributes from the device and its parents.

```sh
udevadm info --attribute-walk --path="/sys/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10:1.0/bluetooth/hci0/hci0:256" | less
```

Finally, to build the rule, I used both the idProduct and idVendor.

### Additional notes

In order to use the trackpad via bluetooth, the trackpad, should be disconnect, then turned off and on again and it should be available in the list of bluetooth devices. See https://github.com/mwyborski/Linux-Magic-Trackpad-2-Driver

# Todo

* Improve zsh conf
* Fix Alt+{hjkl} mappings in vim
* Make gx work for opening url in browser
* https://github.com/Orange-OpenSource/hurl
* Try https://github.com/rest-nvim/rest.nvim
* Try https://orgmode.org/guide/index.html
* remove terminal plugin from nvim
* play with a new compositor https://www.reddit.com/r/unixporn/comments/s5i6i3/oc_an_xorg_compositor_forked_from_xcompmgr_with/

# i3 cheatsheet
win + a to go to parent
win + ^ for stacked
win + $ for tabbed
win + ù for horizontal
win + * for vertical
