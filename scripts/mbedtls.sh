#!/bin/bash

set -e

cd src
tar -xf mbedtls-3.1.0.tar.gz
cd mbedtls-3.1.0
patch -p1 <../../patches/mbedtls-fix-vsnprintf_on_winxp.patch
export WINDOWS_BUILD=1
export CC=$TARGET-gcc
make no_test -j$(nproc)
make install DESTDIR=$BUILDDIR/mbedtls
cd ..
rm -rf mbedtls-3.1.0