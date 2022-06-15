
# Toy Language, from the [MLIR Tutoria](https://mlir.llvm.org/docs/Tutorials/Toy/)

This is the implementation of [Chapter 3](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-3/)

Last chapter created MLIR Dialect for the Toy language, we are no longer using the AST as an intermediate representation. In fast, the AST is dead from now on. We also created our own IR, we
are not using LLVM IR, we created our own!   
In this chapter the tutorial extends our Toy framework with the ability to create optimisation passes on our own IR - the ToyIR. We are are running passes on our ToyIR! That's freedom! 

The output of this stage builds on the last chapter. It adds an extra flag `-opt` which invokes
the optimisations created in this chapter on the IR.     
It can be noticed that *no reshape operations remain after canonicalization* (optimisation).


### To Compile
`source ./build-proj.sh $LLVM_INSTALL_DIR`

### To try out
```bash
    echo; echo; echo "===--------------------- THE AST (IR) of the input code  -----------===="
    ./build/toyc-ch3 "$TOY_CODES_DIR/example_2.toy"  -emit=ast

    echo; echo; echo "===--------------------- THE TOY DIALECT IR of the input code ----------===="
    ./build/toyc-ch3 "$TOY_CODES_DIR/example_2.toy"  -emit=mlir

    echo; echo; echo "===------- Invoking Optimation '-opt' on the TOY DIALECT IR of the input code => MAGIC !!! -----===="
    ./build/toyc-ch3 "$TOY_CODES_DIR/example_2.toy"  -emit=mlir -opt

```
