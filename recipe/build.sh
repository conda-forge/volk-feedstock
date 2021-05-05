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
cmake ${CMAKE_ARGS} -G "Ninja" .. "${cmake_config_args[@]}"
cmake --build . --config Release -- -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
ctest --output-on-failure || true
fi
cmake --build . --config Release --target install
