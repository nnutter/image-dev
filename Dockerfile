FROM fedora:27

RUN dnf install --assumeyes \
        ShellCheck \                                                                                                                         
        ansible \                                                                                                                            
        ansible-lint \                                                                                                                       
        autoconf \                                                                                                                           
        automake \                                                                                                                           
        bash-completion \                                                                                                                    
        findutils \                                                                                                                          
        git \                                                                                                                                
        gnupg2 \                                                                                                                             
        libffi-devel \                                                                                                                       
        libtool \                                                                                                                            
        libxslt-devel \                                                                                                                      
        libyaml-devel \                                                                                                                      
        man-db \                                                                                                                             
        man-pages \                                                                                                                          
        mosh \                                                                                                                               
        ncurses-devel \                                                                                                                      
        openssl-devel \                                                                                                                      
        readline-devel \                                                                                                                     
        sudo \                                                                                                                               
        tmux \                                                                                                                               
        unixODBC-devel \                                                                                                                     
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
