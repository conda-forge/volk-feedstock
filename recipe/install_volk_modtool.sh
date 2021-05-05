#!/bin/bash

cd build

cmake -P python/volk_modtool/cmake_install.cmake

# delete the mangled volk_modtool script and install it fresh from the source
rm -f "$PREFIX/bin/volk_modtool"
cp "$SRC_DIR/python/volk_modtool/volk_modtool" "$PREFIX/bin/volk_modtool"
