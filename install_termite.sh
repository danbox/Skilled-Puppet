#!/usr/bin/env sh

git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
sudo apt-get install -f g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac
sudo apt-get install -f libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev
sudo apt-get install -f libxml2-utils gperf
sudo apt-get install -f libpcre2-dev
cd vte-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install
sudo desktop-file-install termite.desktop
sudo cp /usr/local/lib/libvte-2.91.a /usr/local/lib/libvte-2.91.la \
/usr/local/lib/libvte-2.91.so /usr/local/lib/libvte-2.91.so.0 \
/usr/local/lib/libvte-2.91.so.0.4400.1 /usr/lib
sudo mkdir -p /lib/terminfo/x; sudo ln -s \
/usr/local/share/terminfo/x/xterm-termite \
/lib/terminfo/x/xterm-termite
