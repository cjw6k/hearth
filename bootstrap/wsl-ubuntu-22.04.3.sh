#!/usr/bin/env bash

set -xeuo pipefail

git config --global pull.rebase true

sudo apt update && sudo apt upgrade

sudo apt install \
  neofetch \
  pre-commit \
  silversearcher-ag

pip install --upgrade pre-commit

wget https://github.com/go-task/task/releases/download/v3.33.1/task_linux_amd64.deb
sudo dpkg -i task_linux_amd64.deb
rm task_linux_amd64.deb

wget https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64
chmod +x hadolint-Linux-x86_64
sudo mv hadolint-Linux-x86_64 /usr/local/bin/hadolint

dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
cp "$dir"/profile/.b* "$dir"/profile/.d* "$dir"/profile/.h* ~/
rm ~/.bashrc && ln -s ~/.bashrc_dispatch ~/.bashrc
rm ~/.profile && ln -s ~/.bashrc_dispatch ~/.profile
ln -s ~/.bashrc_dispatch ~/.bash_profile
ln -s ~/.bashrc_dispatch ~/.bash_login

task bootstrap
