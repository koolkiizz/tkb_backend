FROM ubuntu:18.04
MAINTAINER kienpt <phamtrungkien@vnpt.vn>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN sed -i 's/ universe/ universe multiverse/' /etc/apt/sources.list
RUN apt update &&                  \
    apt upgrade -y &&              \
    apt dist-upgrade -y &&         \
    apt install -yq --no-install-recommends \
        apt-utils                  \
        git                        \
        wget                       \
        xvfb                       \
        flex                       \
        dh-make                    \
        debhelper                  \
        checkinstall               \
        fuse                       \
        snapcraft                  \
        bison                      \
        libxcursor-dev             \
        libxcomposite-dev          \
        software-properties-common \
        build-essential            \
        libssl-dev                 \
        libxcb1-dev                \
        libx11-dev                 \
        libgl1-mesa-dev            \
        libudev-dev                \
        qt5-default                \
        qtbase5-private-dev        \
        curl                       \
        git                        \
        apache2                    \
        libapache2-mod-php7.2      \
        php7.2-cli                 \
        php7.2-json                \
        php7.2-curl                \
        php7.2-fpm                 \
        php7.2-gd                  \
        php7.2-ldap                \
        php7.2-mbstring            \
        php7.2-mysql               \
        php7.2-soap                \
        php7.2-sqlite3             \
        php7.2-xml                 \
        php7.2-zip                 \
        php7.2-intl                \
        locales                \
    && apt clean

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set locales
RUN locale-gen en_US.UTF-8

WORKDIR /home/root/

CMD ["/bin/bash"]

#RUN service enable apache2