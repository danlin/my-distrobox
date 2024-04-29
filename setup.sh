#!/bin/sh

git config --global user.name "Daniel Lindenfelser"
git config --global user.email daniel@lindenfelser.de
git config --global init.defaultBranch main
git config --global pull.rebase true

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yadm clone https://github.com/danlin/danlin

distrobox-export --app neovide
