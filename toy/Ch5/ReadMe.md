
# Toy Language, from the [MLIR Tutoria](https://mlir.llvm.org/docs/Tutorials/Toy/)

This is the implementation of [Chapter 5](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-5/)

In the last chapter, we laid the foundation for our ToyIR's interoperability with other MLIR dialects. The advantange of this is that we can take advantage of existing work done oter dialects.

In this chapter, we intend to perform some Affine transformations as part of our code optimatization. Since this our own custom IR infrastructure we could implement whatever features we want. However, we don't have to do this. We can reuse whatever already exist in the Affine Dialect. To do this we partially convert some aspect of our IR into the Affine dialect and perform our optimization.     

The output of this stage is also similar to that the last chapter. In this case we can use `-emit=mlir-affine` to pretty-print out the result of partial lowering to the Affine Dialect.

### To Compile
`source ./build-proj.sh $LLVM_INSTALL_DIR`

### To try out
```bash

echo; echo; echo "===--------------------- THE TOY DIALECT IR of the input code  -----------===="
./build/toyc-ch5 "$TOY_CODES_DIR/example_5.toy"  -emit=mlir

echo; echo; echo "===--------------------- THE TOY DIALECT IR lowered (converted) partially to Affine-IR Dialect  -----------===="
./build/toyc-ch5 "$TOY_CODES_DIR/example_5.toy"  -emit=mlir-affine

echo; echo; echo "===------- Invoking Optimation '-opt' on the IR of the input code! -----===="
./build/toyc-ch5 "$TOY_CODES_DIR/example_5.toy"  -emit=mlir-affine -opt

```
