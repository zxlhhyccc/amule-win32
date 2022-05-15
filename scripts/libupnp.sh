#!/bin/bash

set -e

cd src/libupnp-1.14.12
mkdir build-$TARGET
cd build-$TARGET
../configure --host=$TARGET --prefix=$BUILDDIR/libupnp --enable-static=yes --enable-shared=no --disable-samples --disable-ipv6
mkdir -p $BUILDDIR/libupnp/lib
ln -s lib $BUILDDIR/libupnp/lib64
make -j$(nproc)
make install
sed -i 's/-lupnp -lixml/& -liphlpapi -lws2_32 /g' $BUILDDIR/libupnp/lib/pkgconfig/libupnp.pc
make clean
