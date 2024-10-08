#!/bin/sh
set -e

SRC="src"
OUT="gh-pages/channel"

# download and extract sc4pac CLI
if [ ! -f sc4pac-latest.zip ]; then
    SC4PAC_ZIP_URL="$(curl -s https://api.github.com/repos/memo33/sc4pac-tools/releases/latest | grep browser_download_url | cut -d '"' -f 4)"
    curl -L "${SC4PAC_ZIP_URL}" > sc4pac-latest.zip
fi
rm -rf sc4pac-latest
unzip -q -d sc4pac-latest sc4pac-latest.zip
echo "sc4pac version: $(./sc4pac-latest/sc4pac --version)"

# build channel
rm -rf "$OUT"
./sc4pac-latest/sc4pac channel build --output "$OUT" "$SRC"
