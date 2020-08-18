FROM debian:buster

RUN apt-get update && \
    apt-get -y install live-build && \
    sed -i '1161s%umount%#umount%' /usr/share/debootstrap/functions

WORKDIR /live
CMD ["lb", "build"]