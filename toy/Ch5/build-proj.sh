#! /usr/bin/env bash

CURR_DIR=$PWD
BUILD_DIR="/DATA/DEV/Compilers/llvm/build"
LLVM_INSTALL="/DATA/DEV/Compilers/llvm/install"
APP_INSTALL="$CURR_DIR/bin"

rm -rf $APP_INSTALL
rm -rf build

mkdir $APP_INSTALL
mkdir build
cd build

export CC=$LLVM_INSTALL/bin/clang
export CXX=$LLVM_INSTALL/bin/clang++

#$CXX --version

cmake -G Ninja .. \
	-DMLIR_DIR=$LLVM_INSTALL/lib/cmake/mlir \
    -DCMAKE_INSTALL_PREFIX=$APP_INSTALL 
	# -DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit 

cmake --build . --target install

cd $CURR_DIR