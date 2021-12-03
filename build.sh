#!/bin/sh
set -e

build="build/"

if [ -d $build ]; then
	echo -n "Build directory ($build) already found. Are you sure you would like to remove it? "
	read _
fi

rm -rf $build
mkdir $build
cd $build

options="
	-DWITH_SYSTEM_GLEW:BOOL=ON
	-DWITH_XR_OPENXR:BOOL=OFF
	-DWITH_HARU:BOOL=OFF
	-DWITH_IMAGE_OPENJPEG:BOOL=OFF"

cmake ../ $options

echo -n "Build environment setup. Would you like to start build? "
read _

numthreads=$(sysctl -n hw.ncpu)
make -j$numthreads

mkdir -p ../release/datafiles/locale/languages # so cmake doesn't complain
make install # don't worry, this will only install in the build directory!