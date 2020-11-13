#!/bin/bash

./bootstrap
./configure --prefix="$PREFIX" \
    --enable-ftdi \
    CFLAGS="-Wno-implicit-fallthrough -Wno-format-truncation -Wno-format-overflow -Wno-error=tautological-compare"
make
make install

# conda chokes on non-ascii paths
rm $PREFIX/share/openocd/scripts/target/?1879x?1?.cfg
rm $PREFIX/share/openocd/scripts/target/1986??1?.cfg
