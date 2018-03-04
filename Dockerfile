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
VOLUME /home/nnutter
WORKDIR /home/nnutter
