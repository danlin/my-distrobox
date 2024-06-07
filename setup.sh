#!/bin/sh

echo "Setup GIT"
git config --global user.name "Daniel Lindenfelser"
git config --global user.email daniel@lindenfelser.de
git config --global init.defaultBranch main
git config --global pull.rebase true

echo "Install yay and my AUR packages"
if ! command -v yay &> /dev/null; then
YAY_DIR=$(mktemp -d)
pushd ${YAY_DIR}
git clone https://aur.archlinux.org/yay.git
cd yay
yes | makepkg -si
rm -rf ${YAY_DIR}
popd
fi
yes | yay -Syu --needed --noconfirm - < ./aur-packages

echo "Install tmux Plugin Manager"
if [ ! -d ~/.tmux/plugins/tpm ]
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
NO_INTERACTIVE=true sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Setup yadm"
yadm clone https://github.com/danlin/danlin

echo "Create Application Links"
distrobox-export --app neovide
distrobox-export --app "Android Studio"
distrobox-export --app DataGrip
distrobox-export --app Fleet
distrobox-export --app RustRover

