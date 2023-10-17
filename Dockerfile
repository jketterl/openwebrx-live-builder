FROM debian:bookworm

RUN apt-get update && \
    apt-get -y install live-build git devscripts && \
    sed -i '1161s%umount%#umount%' /usr/share/debootstrap/functions

ADD docker/*.sh /live/
ADD config /live/config

WORKDIR /live
RUN ./build-tasksel-data.sh

CMD ["./run-build.sh"]