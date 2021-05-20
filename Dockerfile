FROM        ubuntu:20.04

LABEL       author="mrkrabs" maintainer="bl4ckspr4y@protonmail.com"

RUN         dpkg --add-architecture i386
            apt -qq update \
            && apt -qq upgrade -y \
            && apt install -y libstdc++6 lib32stdc++6 tar curl iproute2 openssl wget g++ gcc g++:i386 gcc:i386 g++-multilib g++-multilib:i386 make git unzip libssl-dev:i386 \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
