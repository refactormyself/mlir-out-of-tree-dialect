#! /usr/bin/env bash

CURR_DIR=$PWD
LLVM_BUILD_DIR=$1
LLVM_INSTALL_DIR=$2

mkdir $APP_INSTALL
# rm -rf build
mkdir build
cd build

cmake -G Ninja .. \
	-DMLIR_DIR=$LLVM_INSTALL_DIR/lib/cmake/mlir \
	-DLLVM_EXTERNAL_LIT=$LLVM_BUILD_DIR/bin/llvm-lit

cmake --build . --target check-standalone
cd $CURR_DIR
