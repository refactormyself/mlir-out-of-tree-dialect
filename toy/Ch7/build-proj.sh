#! /usr/bin/env bash

CURR_DIR=$PWD
LLVM_BUILD_DIR=$1
LLVM_INSTALL_DIR=$2

rm -rf build
mkdir build
cd build

cmake -G Ninja .. \
	-DMLIR_DIR=$LLVM_INSTALL_DIR/lib/cmake/mlir

cmake --build .

cd $CURR_DIR
