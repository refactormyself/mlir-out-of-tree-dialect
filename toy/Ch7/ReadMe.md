
# Toy Language, from the [MLIR Tutoria](https://mlir.llvm.org/docs/Tutorials/Toy/)

This is the implementation of [Chapter 7](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-7/)

This chapter extends the Toy Language with a composite Type. It puts together all the features which has been built in previous chapter, compiling from a Toy language source code to LLVM IR.

The output works like that of Chaper 6, the only difference is in the added feature - `struct`.


### To Compile
`source ./build-proj.sh $LLVM_INSTALL_DIR`

### To try out
```bash

echo; echo; echo "===--------------------- THE TOY DIALECT IR of the input code  -----------===="
./build/toyc-ch7 "$TOY_CODES_DIR/example_7.toy"  -emit=mlir -opt

echo; echo; echo "===--------------------- THE TOY DIALECT IR (+ the partial Affine IR) lowered (converted) fully to the LLVM-IR Dialect  -----------===="
./build/toyc-ch7 "$TOY_CODES_DIR/example_7.toy"  -emit=mlir-llvm -opt

echo; echo; echo "===------- From LLVM-IR Dialect to the LLVM IR which is out side MLIR ------===="
./build/toyc-ch7 "$TOY_CODES_DIR/example_7.toy"  -emit=llvm -opt

echo; echo; echo "===--- Using the Jit compiler from the main LLVM to execute IR of the input code! ---==="
./build/toyc-ch7 "$TOY_CODES_DIR/example_7.toy"  -emit=jit -opt

# echo; echo; echo "===--------------------- Track the evolution of the IR throughout the pipeline  -----------===="
# ./build/toyc-ch7 "$TOY_CODES_DIR/example_7.toy"  -emit=jit --print-ir-after-all

```
