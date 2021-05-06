setlocal EnableDelayedExpansion

cd build

cmake -P python/volk_modtool/cmake_install.cmake
if errorlevel 1 exit 1

:: delete the mangled volk_modtool script and install it fresh from the source
:: to the Scripts directory so it is found and installed correctly as noarch Python
del "%LIBRARY_PREFIX%\bin\volk_modtool.py"
if errorlevel 1 exit 1

xcopy "%SRC_DIR%\python\volk_modtool\volk_modtool" "%PREFIX%\Scripts\"
if errorlevel 1 exit 1
