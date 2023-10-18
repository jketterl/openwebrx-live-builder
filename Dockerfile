FROM debian:bookworm

RUN apt-get update && \
    apt-get -y install live-build git devscripts && \
    sed -i '1161s%umount%#umount%' /usr/share/debootstrap/functions

ADD docker/*.sh /live/
WORKDIR /live
RUN ./build-tasksel-data.sh

ADD config /live/config

CMD ["./run-build.sh"]