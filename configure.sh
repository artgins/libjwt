#!/bin/bash

CFLAGS="-Wno-error=char-subscripts -O3 -g -ggdb -fPIC"
#CFLAGS+=" -I/lib/modules/$(uname -r)/build/include"
export CFLAGS
export PKG_CONFIG_PATH=/yuneta/development/outputs_ext/lib/pkgconfig
export CC=musl-gcc
export LDFLAGS="-static"

rm -rf build
mkdir build
cd build

cmake \
    -DCMAKE_INSTALL_PREFIX:PATH="/yuneta/development/outputs_ext" \
    -DEXCLUDE_DEPRECATED=TRUE \
    -DWITH_GNUTLS=OFF \
    -DWITH_MBEDTLS=ON \
    ..

make install
