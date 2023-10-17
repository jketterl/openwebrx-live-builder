#!/bin/bash
set -euo pipefail

pushd /tmp
git clone https://salsa.debian.org/installer-team/tasksel.git
pushd tasksel

git checkout 3.73
cat > tasks/openwebrx << EOF
Task: openwebrx
Relevance: 1
Description: OpenWebRX SDR server
 Open source, multi-user SDR receiver with a web interface
Key:
 openwebrx
Section: server
Packages: list
  openwebrx
Test-new-install: mark show
EOF
debuild -us -uc

popd

cp tasksel-data*.deb ~/

popd




