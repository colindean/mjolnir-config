# 🛑⚠️💤 

⚠️ I no longer use or maintain this configuration. ⚠️

I ported this and publicized it as [my Hammerspoon configuration](https://github.com/colindean/hejmo/tree/master/dotfiles/hammerspoon).

# @colindean's Mjolnir configuration

[Mjolnir](http://mjolnir.io) is a fantastic window management system for OS X.

Get mjolnir from its website or do the following, which is much easier if you
have Homebrew installed (and you probably do if you're looking at this):

    brew install lua luarocks
    mkdir -p ~/.luarocks
    echo 'rocks_servers = { "http://rocks.moonscript.org" }' > ~/.luarocks/config.lua
    brew install caskroom/cask/brew-cask && brew cask install mjolnir
    luarocks install mjolnir.bg.grid
    luarocks install mjolnir.hotkey
    luarocks install mjolnir.fnutils
    luarocks install mjolnir.keycodes
    luarocks install mjolnir.application
    luarocks install mjolnir.geometry
    luarocks install mjolnir.screen

Those last lines install some Lua deps with luarocks.

Fortunately, this installs everything that is needed as dependencies!

Then, symlink this directory to ~/.mjolnir with something such as:

    rm -rf ~/.mjolnir; ln -s `pwd` ~/.mjolnir

(You're removing it because there's a pretty good chance that you started
Mjolnir, and it created an empty directory for you.)

You can then start up Mjolnir and enjoy window management like I do. Read
through the `window_mgmt.lua` script to see what the hotkeys do. It's very
straightforward, especially if you've used Vim previously.
