setlocal EnableDelayedExpansion

cd build

cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
if errorlevel 1 exit 1

cmake -P apps/cmake_install.cmake
if errorlevel 1 exit 1

cmake -P lib/cmake_install.cmake
if errorlevel 1 exit 1

:: install list_cpu_features manually so we can rename it specific to volk
:: (it is statically linked to cpu_features, so don't have to install the lib)
cmake -E copy cpu_features/list_cpu_features.exe "%LIBRARY_BIN%/list_cpu_features_volk.exe"
