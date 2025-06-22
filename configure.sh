#!/bin/bash

CFLAGS="-Wno-error=char-subscripts -O3 -g -ggdb -fPIC"
#CFLAGS+=" -I/lib/modules/$(uname -r)/build/include"
export CFLAGS
export PKG_CONFIG_PATH=/yuneta/development/outputs_ext_static/lib/pkgconfig
export CC=/usr/local/bin/musl-gcc
export LDFLAGS="-static"

export CFLAGS="-Wno-error=char-subscripts -O2 -DNDEBUG -fPIC"
#export LDFLAGS="-static -no-pie"


# rm -rf build
mkdir -p build
cd build
rm -rf *

cp ../include/jwt_export.h .
cmake \
    -DCMAKE_INSTALL_PREFIX:PATH="/yuneta/development/outputs_ext_static" \
    -DEXCLUDE_DEPRECATED=TRUE \
    -DWITH_GNUTLS=OFF \
    -DWITH_MBEDTLS=ON \
    ..

cp ../include/jwt_export.h .

make install
