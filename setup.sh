#!/bin/bash

echo "Setup GIT"
git config --global user.name "Daniel Lindenfelser"
git config --global user.email daniel@lindenfelser.de
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global --add credential.helper "cache --timeout 21600"
git config --global --add credential.helper azure
git config --global --add credential.helper oauth

echo "Install yay and my AUR packages"
if ! command -v yay &>/dev/null; then
  YAY_DIR=$(mktemp -d)
  pushd ${YAY_DIR}
  git clone https://aur.archlinux.org/yay.git
  cd yay
  yes | makepkg -si
  rm -rf ${YAY_DIR}
  popd
fi
yes | yay -Syu --needed --noconfirm - <./aur-packages

echo "Install tmux Plugin Manager"
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  NO_INTERACTIVE=true sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Install LazyVim"
if [ ! -d ~/.config/nvim ]; then
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}

  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git

  mkdir -p ~/.config/neovide
fi

echo "Setup yadm"
if [ ! -d /var/home/danlin/.local/share/yadm/repo.git ]; then
  yadm clone https://github.com/danlin/danlin
fi

echo "Create Application Links"
distrobox-export --app neovide
