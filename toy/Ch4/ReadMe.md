
# Toy Language, from the [MLIR Tutoria](https://mlir.llvm.org/docs/Tutorials/Toy/)

This is the implementation of [Chapter 4](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-4/)

In the last chapter with add ability to run passes on our own IR - the ToyIR. Since it is a dialect of MLIR, it should interact with other dialect. All dialects are equal in MLIR even the good old dragon - LLVM-IR Dialect. This change introduces the feature of MLIR that enables this cohesion and coexistence between dialects - the INTERFACE. Make no fuss about it, it the same OOP concept called *Abstract Class* in C++ and called Interface in some other languages like C#. The tutorial expands further.     

The output of this stage is similar to that the last chapter. What has been done here is interfacing our ToyIR framework with other IR dialect, so that we can become "equal" with the likes of LLVM-IR. The interopration at scale between all dialects is a key feature of MLIR.

### To Compile
`source ./build-proj.sh $LLVM_INSTALL_DIR`

### To try out
```bash
    echo; echo; echo "===--------------------- THE AST (IR) of the input code  -----------===="
    ./build/toyc-ch4 "$TOY_CODES_DIR/example_2.toy"  -emit=ast

    echo; echo; echo "===--------------------- THE TOY DIALECT IR of the input code ----------===="
    ./build/toyc-ch4 "$TOY_CODES_DIR/example_2.toy"  -emit=mlir

    echo; echo; echo "===------- Invoking Optimation '-opt' on the TOY DIALECT IR of the input code => MAGIC !!! -----===="
    ./build/toyc-ch4 "$TOY_CODES_DIR/example_2.toy"  -emit=mlir -opt

```
