#!/bin/bash
set -euo pipefail

pushd /tmp
git clone https://salsa.debian.org/installer-team/tasksel.git
pushd tasksel

git checkout 3.73
patch -Np1 << EOF
diff --git a/debian/changelog b/debian/changelog
index 1160aa20..5a11aea6 100644
--- a/debian/changelog
+++ b/debian/changelog
@@ -1,3 +1,9 @@
+tasksel (3.73.1) unstable; urgency=medium
+
+  * Add OpenWebRX task
+
+ -- Jakob Ketterl <jakob.ketterl@gmx.de>  Fri, 20 Oct 2023 19:02:00 +0000
+
 tasksel (3.73) unstable; urgency=medium

   [ Roland Clobus ]
diff --git a/tasks/openwebrx b/tasks/openwebrx
index e69de29b..7a58d5e7 100644
--- a/tasks/openwebrx
+++ b/tasks/openwebrx
@@ -0,0 +1,10 @@
+Task: openwebrx
+Relevance: 1
+Description: OpenWebRX SDR web server
+ Open source, multi-user SDR receiver with a web interface
+Key:
+ openwebrx
+Section: server
+Packages: list
+  openwebrx
+Test-new-install: mark show
EOF
debuild -us -uc

popd

cp task*.deb ~/

popd




