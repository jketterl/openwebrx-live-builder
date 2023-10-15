FROM debian:bookworm

RUN apt-get update && \
    apt-get -y install live-build && \
    sed -i '1161s%umount%#umount%' /usr/share/debootstrap/functions

ADD docker/run-build.sh /live/run-build.sh
ADD config /live/config

WORKDIR /live
CMD ["./run-build.sh"]