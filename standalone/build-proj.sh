#! /usr/bin/env bash

CURR_DIR=$PWD
BUILD_DIR="/DATA/DEV/Compilers/llvm/build"
LLVM_INSTALL="/DATA/DEV/Compilers/llvm/install"
APP_INSTALL="$CURR_DIR/bin"

mkdir $APP_INSTALL
rm -rf build
mkdir build
cd build

cmake -G Ninja .. \
	-DMLIR_DIR=$LLVM_INSTALL/lib/cmake/mlir \
	-DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit \
        -DCMAKE_INSTALL_PREFIX=$APP_INSTALL

cmake --build . --target check-standalone

ninja install

cd $CURR_DIR
