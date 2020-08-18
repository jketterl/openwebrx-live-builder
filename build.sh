#!/usr/bin/env bash
set -euo pipefail

docker build --pull -t openwebrx-live-builder:latest .
docker run -v$(pwd)/config:/live/config --privileged --name openwebrx-live-builder openwebrx-live-builder:latest
docker cp openwebrx-live-builder:/live/live-image-amd64.hybrid.iso .
docker rm openwebrx-live-builder