#!/bin/bash
set -euo pipefail

mkdir -p config/packages.binary/
cp ~/task*.deb config/packages.binary/

lb config
lb build