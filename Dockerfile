FROM fedora:27

RUN dnf install --assumeyes \
        ansible \
        ansible-lint \
        bash-completion \
        findutils \
        git \
        gnupg2 \
        man-pages \
        mosh \
        ShellCheck \
        sudo \
        tmux \
        vim-enhanced \
        yamllint \
    && dnf clean all \
    && useradd --home /home/nnutter --shell /bin/bash nnutter \
    && echo "nnutter ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nnutter

COPY entrypoint.sh /usr/local/bin/

USER nnutter:nnutter
VOLUME /home/nnutter
WORKDIR /home/nnutter

ENTRYPOINT ["/bin/bash", "/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash", "-l"]
