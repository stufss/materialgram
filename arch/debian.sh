#!/bin/bash

export wkdir=$PWD
cd ..
mkdir -p Materialgram/DEBIAN
cp -r $wkdir/usr Materialgram/
rm -rf Materialgram/usr/share/metainfo
rm -rf Materialgram/usr/share/dbus-1
mv Materialgram/usr/share/applications/*.desktop Materialgram/usr/share/applications/materialgram.desktop
cat <<EOF >> Materialgram/DEBIAN/control
Package: materialgram
Architecture: amd64
Maintainer: @ghazzor
Priority: optional
Version: $VERSION
Description: Unofficial Telegram Desktop with Material Design
EOF
chmod +x Materialgram/usr/bin/materialgram
chmod +x Materialgram/usr/share/applications/*.desktop
sed -i 's/Name=materialgram/Name=Materialgram/g' Materialgram/usr/share/applications/materialgram.desktop
dpkg-deb -b Materialgram
mv Materialgram.deb materialgram-$VERSION.deb
cd $wkdir