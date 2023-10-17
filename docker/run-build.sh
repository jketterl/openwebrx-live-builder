#!/bin/bash
set -euo pipefail

mkdir -p config/packages.binary/
cp ~/tasksel-data*.deb config/packages.binary/

lb config
lb build