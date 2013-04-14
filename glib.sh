#!/bin/sh
wget http://ftp.gnome.org/pub/gnome/sources/glib/2.36/glib-2.36.0.tar.xz

tar xf glib-2.36.0.tar.xz

cd glib-2.36.0

./configure --prefix=`pwd`/../glib
make 
make install

cd ..

rm -rf glib-2.36.0
rm glib-2.36.0.tar.xz