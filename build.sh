#!/usr/bin/env bash
set -euo pipefail

docker build --pull -t openwebrx-live-builder:latest .

docker volume create openwebrx-live-builder-cache

RC=0
docker run -v openwebrx-live-builder-cache:/live/cache --privileged --name openwebrx-live-builder openwebrx-live-builder:latest &&\
docker cp openwebrx-live-builder:/live/openwebrx-live-amd64.hybrid.iso $(date +"%Y-%m-%d")-openwebrx-live-amd64.iso  || RC=$?
docker rm openwebrx-live-builder
exit $RC