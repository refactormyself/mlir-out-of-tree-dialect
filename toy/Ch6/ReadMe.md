
# Toy Language, from the [MLIR Tutoria](https://mlir.llvm.org/docs/Tutorials/Toy/)

This is the implementation of [Chapter 6](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-6/)

From the partial lowering into the Affine Dialect in the last chapter, we perform a full lowering (conversion) into the LLVM-IR Dialect in this chapter. You can view the LLVM-IR dialect representation of the code with `-emit=mlir-llvm`. To use the infrastructure (e.g JIT) in the good old LLVM we have to covert to the original LLVM-IR (which is not an MLIR dialect). To view the representation of the code in the original LLVM-IR use `-emit=llvm`.

Since we now speak the language of main LLVM we could use the JIT compiler to compile and execute our code. The result can be obtained with `-emit=jit`.


### To Compile
`source ./build-proj.sh $LLVM_INSTALL_DIR`

### To try out
```bash

echo; echo; echo "===--------------------- THE TOY DIALECT IR of the input code  -----------===="
./build/toyc-ch6 "$TOY_CODES_DIR/example_5.toy"  -emit=mlir -opt

echo; echo; echo "===--------------------- THE TOY DIALECT IR (+ the partial Affine IR) lowered (converted) fully to the LLVM-IR Dialect  -----------===="
./build/toyc-ch6 "$TOY_CODES_DIR/example_5.toy"  -emit=mlir-llvm -opt

echo; echo; echo "===------- From LLVM-IR Dialect to the LLVM IR which is out side MLIR ------===="
./build/toyc-ch6 "$TOY_CODES_DIR/example_5.toy"  -emit=llvm -opt

echo; echo; echo "===--- Using the Jit compiler from the main LLVM to execute IR of the input code! ---==="
./build/toyc-ch6 "$TOY_CODES_DIR/example_5.toy"  -emit=jit -opt

# echo; echo; echo "===--------------------- Track the evolution of the IR throughout the pipeline  -----------===="
# ./build/toyc-ch6 "$TOY_CODES_DIR/example_5.toy"  -emit=jit --print-ir-after-all

```
