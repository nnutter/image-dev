FROM fedora:27

RUN dnf install --assumeyes \
        ansible \
        ansible-lint \
        findutils \
        git \
        gnupg2 \
        mosh \
        ShellCheck \
        sudo \
        tmux \
        vim-enhanced \
        yamllint \
    && dnf clean all \
    && useradd --create-home --home /home/nnutter --shell /bin/bash nnutter \
    && echo "nnutter ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nnutter

USER nnutter:nnutter
WORKDIR /home/nnutter

RUN    git --git-dir ~/.dotfiles.git --work-tree ~ init \
    && git --git-dir ~/.dotfiles.git               config status.showUntrackedFiles no \
    && git --git-dir ~/.dotfiles.git               remote add -f origin https://github.com/nnutter/dotfiles.git \
    && git --git-dir ~/.dotfiles.git --work-tree ~ checkout -f master \
    && git --git-dir ~/.dotfiles.git               remote set-url origin git@github.com:nnutter/dotfiles.git
