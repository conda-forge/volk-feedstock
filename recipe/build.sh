#!/bin/bash

# copy the cpu_features license to the source root
cp "cpu_features/LICENSE" "LICENSE_CPU_FEATURES"

mkdir build
cd build

cmake_config_args=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_INSTALL_PREFIX=$PREFIX
    -DCMAKE_PREFIX_PATH=$PREFIX
    -DENABLE_PROFILING=OFF
    -DENABLE_TESTING=ON
)
cmake -G "Ninja" .. "${cmake_config_args[@]}"
# single-threaded build to avoid https://foss.heptapod.net/pypy/pypy/-/issues/3299
cmake --build . --config Release -- -j1
ctest --output-on-failure || true
cmake --build . --config Release --target install
