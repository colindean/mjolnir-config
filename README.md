# @colindean's Mjolnir configuration

[Mjolnir](http://mjolnir.io) is a fantastic window management system for OS X.

Get mjolnir from its website or do the following, which is much easier if you
have Homebrew installed (and you probably do if you're looking at this):

    brew install lua luarocks
    mkdir p ~/.luarocks
    echo 'rocks_servers = { "http://rocks.moonscript.org" }' > ~/.luarocks/config.lua
    brew install caskroom/cask/brew-cask && brew cask install mjolnir
    luarocks install mjolnir.bg.grid

That last line installs some Lua deps with luarocks.

Fortunately, this installs everything that is needed as dependencies!

Then, symlink this directory to ~/.mjolnir with something such as:

    rm -rf ~/.mjolnir; ln -s `pwd` ~/.mjolnir

(You're removing it because there's a pretty good chance that you started
Mjolnir, and it created an empty directory for you.)

You can then start up Mjolnir and enjoy window management like I do. Read
through the `window_mgmt.lua` script to see what the hotkeys do. It's very
straightforward, especially if you've used Vim previously.