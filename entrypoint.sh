#!/bin/bash

set -o errexit -o nounset -o pipefail

git --git-dir ~/.dotfiles.git --work-tree ~ init
git --git-dir ~/.dotfiles.git               config status.showUntrackedFiles no
git --git-dir ~/.dotfiles.git               remote add -f origin https://github.com/nnutter/dotfiles.git
git --git-dir ~/.dotfiles.git --work-tree ~ checkout -f master
git --git-dir ~/.dotfiles.git               remote set-url origin git@github.com:nnutter/dotfiles.git

exec "$@"
