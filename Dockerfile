FROM ubuntu:18.04

RUN echo 'start build' \
# if you are not in China,delete the following two lines
    && sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y --no-install-recommends --fix-missing \
        ca-certificates \
        libsnappy-dev \
        libgraphicsmagick1-dev \
        libssl-dev \
        git \
        build-essential \
        g++ \
        gcc \
        libjpeg-dev \
        ncurses-dev \
        libqt4-dev \
        libreadline-dev \
        unzip \
        gnuplot \
        gnuplot-x11 \
        ipython \
        cmake \
        curl \
        git-core \
        imagemagick \
        libpng-dev \
        libzmq3-dev \
        libgif-dev \
        wget \
        sudo \
    || apt install -y --no-install-recommends --fix-missing \
        ca-certificates \
        libsnappy-dev \
        libgraphicsmagick1-dev \
        libssl-dev \
        git \
        build-essential \
        g++ \
        gcc \
        libjpeg-dev \
        ncurses-dev \
        libqt4-dev \
        libreadline-dev \
        unzip \
        gnuplot \
        gnuplot-x11 \
        ipython \
        cmake \
        curl \
        git-core \
        imagemagick \
        libpng-dev \
        libzmq3-dev \
        libgif-dev \
        wget \
        sudo \
    && git config --global credential.helper cache \
# Your Gitee_user_name and password here
    && export GIT_USER=111 GIT_PASSWD=222 \
    && git clone https://$GIT_USER:$GIT_PASSWD@gitee.com/A-JiuA/distro.git ~/torch --recursive \
    && cd ~/torch \
    && bash install-deps \
    && ./install.sh \
    && cd ~ \
    && git clone --depth 1 https://$GIT_USER:$GIT_PASSWD@gitee.com/A-JiuA/waifu2x.git \
    && wget https://nchc.dl.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.35/GraphicsMagick-1.3.35.tar.bz2 \
    && tar -xvf GraphicsMagick-1.3.35.tar.bz2 && cd GraphicsMagick-1.3.35.tar.bz2 \
    && ./configure \
    && make && make install \
    && cd ~ && rm -rf GraphicsMagick-1.3.35.tar.bz2 GraphicsMagick-1.3.35

#    && 
