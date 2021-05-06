#!/bin/bash

cd build

cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake

cmake -P apps/cmake_install.cmake

cmake -P lib/cmake_install.cmake

# install list_cpu_features manually so we can rename it specific to volk
# (it is statically linked to cpu_features, so don't have to install the lib)
cmake -E copy cpu_features/list_cpu_features "$PREFIX/bin/list_cpu_features_volk"
