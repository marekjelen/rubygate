#!/bin/sh

# Environment

mkdir -p env
cd env

# Versions

GLIB_VERSION=2.36.0
GLIB_VERSION_SHORT=2.36
GLIB_NET_VERSION=2.36.1
GLIB_NET_VERSION_SHORT=2.36
GPERF_VERSION=3.0.4
FLEX_VERSION=2.5.37
SOUP_VERSION=2.42.1
SOUP_VERSION_SHORT=2.42
INTLTOOL_VERSION=0.50.2
WEBKIT_VERSION=2.0.1

# Paths

ENV_PATH=`pwd`
TARGET_PATH=`pwd`/system

export PATH=$TARGET_PATH/bin:$PATH
export libdir=$TARGET_PATH/lib
export LD_LIBRARY_PATH=$TARGET_PATH/lib
export PKG_CONFIG_PATH=$TARGET_PATH/lib/pkgconfig
export C_INCLUDE_PATH=$TARGET_PATH/include/glib-2.0:$TARGET_PATH/lib/glib-2.0/include
export CPLUS_INCLUDE_PATH=$TARGET_PATH/include/glib-2.0:$TARGET_PATH/lib/glib-2.0/include
#export LDFLAGS="-L$LD_LIBRARY_PATH -lglib-2.0"

#echo $LDFLAGS
#pkg-config --modversion glib-2.0
#exit

# Downloads

[[ ! -f glib-$GLIB_VERSION.tar.xz ]] && wget http://ftp.gnome.org/pub/gnome/sources/glib/$GLIB_VERSION_SHORT/glib-$GLIB_VERSION.tar.xz
[[ ! -f webkitgtk-$WEBKIT_VERSION.tar.xz ]] && wget http://webkitgtk.org/releases/webkitgtk-$WEBKIT_VERSION.tar.xz
[[ ! -f gperf-$GPERF_VERSION.tar.gz ]] && wget http://ftp.gnu.org/pub/gnu/gperf/gperf-$GPERF_VERSION.tar.gz
[[ ! -f flex-$FLEX_VERSION.tar.gz ]] && wget http://downloads.sourceforge.net/project/flex/flex-$FLEX_VERSION.tar.gz
[[ ! -f libsoup-$SOUP_VERSION.tar.xz ]] && wget http://ftp.acc.umu.se/pub/gnome/sources/libsoup/$SOUP_VERSION_SHORT/libsoup-$SOUP_VERSION.tar.xz
[[ ! -f intltool-$INTLTOOL_VERSION.tar.gz ]] && wget https://launchpad.net/intltool/trunk/$INTLTOOL_VERSION/+download/intltool-$INTLTOOL_VERSION.tar.gz
[[ ! -f glib-networking-$GLIB_NET_VERSION.tar.xz ]] && wget http://ftp.gnome.org/pub/gnome/sources/glib-networking/$GLIB_NET_VERSION_SHORT/glib-networking-$GLIB_NET_VERSION.tar.xz

# Glib

#cd $ENV_PATH
#
#rm -rf glib-$GLIB_VERSION
#tar xf glib-$GLIB_VERSION.tar.xz
#
#cd glib-$GLIB_VERSION
#
#./configure --prefix=$TARGET_PATH --enable-gtk-doc-html=no --enable-static=yes --enable-shared=no
#
#make
#make install

# Gperf

#cd $ENV_PATH
#
#rm -rf gperf-$GPERF_VERSION
#tar xf gperf-$GPERF_VERSION.tar.gz
#
#cd gperf-$GPERF_VERSION
#
#./configure --prefix=$TARGET_PATH
#
#make
#make install

# Flex

#cd $ENV_PATH
#
#rm -rf flex-$FLEX_VERSION
#tar xf flex-$FLEX_VERSION.tar.gz
#
#cd flex-$FLEX_VERSION
#
#./configure --prefix=$TARGET_PATH
#
#make
#make install

# IntlTool

#cd $ENV_PATH
#
#rm -rf intltool-$INTLTOOL_VERSION
#tar xf intltool-$INTLTOOL_VERSION.tar.gz
#
#cd intltool-$INTLTOOL_VERSION
#
#./configure --prefix=$TARGET_PATH
#
#make
#make install

# Glib-Networking

#cd $ENV_PATH
#
#rm -rf glib-networking-$GLIB_NET_VERSION
#tar xf glib-networking-$GLIB_NET_VERSION.tar.xz
#
#cd glib-networking-$GLIB_NET_VERSION
#
#./configure --prefix=$TARGET_PATH
#
#make
#make install

# LibSoup

#cd $ENV_PATH
#
#rm -rf libsoup-$SOUP_VERSION
#tar xf libsoup-$SOUP_VERSION.tar.xz
#
#cd libsoup-$SOUP_VERSION
#
#./configure --prefix=$TARGET_PATH
#
#make
#make install

# Webkit-GTK

cd $ENV_PATH

rm -rf webkitgtk-$WEBKIT_VERSION
tar xf webkitgtk-$WEBKIT_VERSION.tar.xz

cd webkitgtk-$WEBKIT_VERSION

make clean

./configure --prefix=$TARGET_PATH \
--enable-spellcheck --enable-video --disable-egl --disable-gles2 --disable-glx \
--enable-xslt --enable-geolocation --enable-svg --enable-svg-fonts \
--enable-web-audio --enable-webgl --enable-accelerated-compositing \
--enable-jit --disable-gtk-doc-html --with-gtk=3.0
# --enable-static --disable-shared
less config.log

make
make install

cd ..

# Clean

#rm flex-$FLEX_VERSION.tar.gz
#rm glib-$GLIB_VERSION.tar.xz
#rm gperf-$GPERF_VERSION.tar.gz
#rm webkitgtk-$WEBKIT_VERSION.tar.xz
#rm libsoup-$SOUP_VERSION.tar.xz