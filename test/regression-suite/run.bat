setlocal
SET MOZ_GFX_SPOOF_WINDOWS_VERSION=60001
SET MOZ_GFX_SPOOF_VENDOR_ID=0x8086
SET MOZ_GFX_SPOOF_DEVICE_ID=0x0046
SET MOZ_GFX_SPOOF_DRIVER_VERSION=8.15.10.2302
START "seleniumfirefox" java -DSTOP.PORT=8079 -DSTOP.KEY=secret -jar selenium-server-standalone-2.39.0.jar
START "nodeserv" node.exe src/server.js
set "PATH=%PATH%;%CD%/node_modules/resemble/bin"
TIMEOUT 2 > nul
node src/x3dom-regression.js -p
taskkill /fi "WINDOWTITLE eq nodeserv"
taskkill /fi "WINDOWTITLE eq seleniumfirefox"