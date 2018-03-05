FROM fedora:27

RUN sed -i -e '/^tsflags=nodocs$/d' /etc/dnf/dnf.conf \
    && dnf upgrade --assumeyes \
    && dnf install --assumeyes https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-27.noarch.rpm \
    && dnf install --assumeyes https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-27.noarch.rpm \
    && dnf install --assumeyes \
        ShellCheck \
        ansible \
        ansible-lint \
        autoconf \
        automake \
        bash-completion \
        findutils \
        git \
        gnupg2 \
        hostname \
        libffi-devel \
        libtool \
        libxslt-devel \
        libyaml-devel \
        man-db \
        man-pages \
        mosh \
        nautilus-dropbox \
        ncurses-devel \
        openssl-devel \
        procps-ng \
        readline-devel \
        sudo \
        tmux \
        unixODBC-devel \
        unzip \
        vim-enhanced \
        yamllint \
    && dnf clean all \
    && useradd --home /home/nnutter --shell /bin/bash nnutter \
    && echo "nnutter ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nnutter

COPY entrypoint.sh /usr/local/bin/

USER nnutter:nnutter
VOLUME /home/nnutter
WORKDIR /home/nnutter

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ENTRYPOINT ["/bin/bash", "/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash", "-l"]
