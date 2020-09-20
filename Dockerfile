FROM ubuntu:16.04

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
        sudo \
    && git config --global credential.helper cache \
# Your Gitee_user_name and password here
    && export GIT_USER=000 GIT_PASSWD=111 \
    && git clone https://$GIT_USER:$GIT_PASSWD@gitee.com/A-JiuA/distro.git ~/torch --recursive \
    && cd ~/torch \
    && bash install-deps \
    && ./install.sh \
    && cd ~ \
    && git clone --depth 1 https://gitee.com/A-JiuA/waifu2x.git \
    && cd waifu2x \
    && ./install_lua_modules.sh 
#    && 
