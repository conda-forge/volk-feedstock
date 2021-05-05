setlocal EnableDelayedExpansion

:: copy the cpu_features license to the source root
copy "cpu_features\LICENSE" "LICENSE_CPU_FEATURES"

:: Make a build folder and change to it
mkdir build
cd build

:: configure
cmake -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DVOLK_PYTHON_DIR="%LIBRARY_PREFIX%\site-packages"
      -DENABLE_MODTOOL=ON ^
      -DENABLE_PROFILING=OFF ^
      -DENABLE_TESTING=ON ^
      ..
if errorlevel 1 exit 1

:: build
cmake --build . --config Release -- -j%CPU_COUNT%
if errorlevel 1 exit 1

:: test
ctest --output-on-failure
::if errorlevel 1 exit 1
