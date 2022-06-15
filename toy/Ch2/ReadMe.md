
# Toy Language, from the [MLIR Tutoria](https://mlir.llvm.org/docs/Tutorials/Toy/)

This is the implementation of [Chapter 2](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-2/)

After defining the Abstract Syntax Tree in Chapter 1 and providing a way to pretty print it's Internal Representation, the tutorial proceed to create an MLIR Dialect for the language in this chapter.

The output of this stage is a tool which can be used to generate the ToyIR, just like we can use
LLVM tools to generate the LLVM-IR of an input code. The ToyIR tools is what we use MLIR to create
in this chapter. First, we define it and generate it and in later chapters we add more feature to our Toy Framework.

The the output of this stage takes any text file as input. From chapter 1, we can use the `-emit=ast` to pretty-print out the AST of the program in the input file, if it is a valid toy program. This chapter adds the ability to pretty-print out the ToyIR of the input code.      

NOTE my delibrate use of *pretty-print*, this is because this is not a full representation of the current code state. Read more in the tutorial.

### To Compile
`source ./build-proj.sh $LLVM_INSTALL_DIR`

### To try out
```bash
    echo; echo; echo "===--------------------- THE AST (IR) of the input code  -----------===="
    ./build/toyc-ch2 "$TOY_CODES_DIR/example_2.toy"  -emit=ast

    echo; echo; echo "===--------------------- THE TOY DIALECT IR of the input code ----------===="
    ./build/toyc-ch2 "$TOY_CODES_DIR/example_2.toy"  -emit=mlir
```

This will print out the AST of the code contained in *my-program.toy*.    
If there is a systax error it will be printed out.
