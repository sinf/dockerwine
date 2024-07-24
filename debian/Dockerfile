FROM docker.io/library/debian:bookworm

RUN apt update
RUN apt install -y curl

#RUN apt install -y wine

#COPY steam_latest.deb /
#RUN dpkg -i /steam_latest.deb || true
#RUN apt --fix-broken install -y
#RUN dpkg -i /steam_latest.deb

RUN dpkg --add-architecture i386
RUN apt install -y libgl1-mesa-dri:i386 libgl1:i386 libc6-i386
RUN apt install -y libc6:amd64 libc6:i386 libegl1:amd64 libegl1:i386 libgbm1:amd64 libgbm1:i386 libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 libgl1:amd64 libgl1:i386 steam-libs-amd64:amd64 steam-libs-i386:i386

# glxgears and vkcube can be used to test if graphics work
RUN apt install -y mesa-utils vulkan-tools

RUN apt install -y wine wine32 wine64 libwine libwine:i386 fonts-wine

# winetricks requires wget and cabextract
RUN apt install -y wget cabextract
RUN curl https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -o /usr/bin/winetricks && chmod +x /usr/bin/winetricks
#RUN winetricks dxvk

# 027c:err:ntlm:ntlm_LsaApInitializePackage no NTLM support, expect problems
# install winbind to fix the above
RUN apt install -y winbind 
RUN apt install -y gnutls-bin

# more debugging stuff
RUN apt install -y less vim

# get newer wine
# https://wiki.winehq.org/Debian
RUN mkdir -pm755 /etc/apt/keyrings
RUN wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
RUN apt update
RUN apt install -y --install-recommends winehq-staging

#RUN useradd -m -u 1000 -U user
#RUN usermod -a -G users,audio,video,dialout,root user

#RUN usermod -a -G tty,uucp,lp user
#RUN usermod -s /bin/bash user

RUN apt install -y locales
RUN sed -i 's/^# \(en_US\.UTF\)/\1/' /etc/locale.gen
RUN locale-gen

RUN apt install -y xvfb x11vnc
RUN apt install -y tmux x11-xserver-utils
RUN apt install -y net-tools

# Not sure if this is necessary, but it's never bad
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    TERM=xterm-256color \
    WINEPREFIX=/home/wine \
    WINEDEBUG=fixme-all \
    DXVK_LOG_LEVEL=warn 

#RUN useradd -m -u 1000 -U user
#RUN usermod -a -G users,audio,video,dialout,root user

# debian's default entrypoint is ok (shell)

