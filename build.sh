#!/bin/sh
wget http://webkitgtk.org/releases/webkitgtk-2.0.0.tar.xz

rm -rf webkitgtk-2.0.0
tar xf webkitgtk-2.0.0.tar.xz

rm webkitgtk-2.0.0.tar.xz

cd webkitgtk-2.0.0

./configure --prefix=`pwd`/../webkitgtk --enable-static --disable-shared \
--enable-spellcheck --enable-glx --enable-egl --enable-gles2 --enable-video \
--enable-xslt --enable-geolocation --enable-svg --enable-svg-fonts \
--enable-web-audio --enable-webgl --enable-accelerated-compositing \
--enable-jit --disable-gtk-doc-html --with-gtk=2.0

cd ..