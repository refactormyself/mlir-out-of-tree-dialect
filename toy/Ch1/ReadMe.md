
# Toy Language, from the [MLIR Tutoria](https://mlir.llvm.org/docs/Tutorials/Toy/)

This is the implementation of [Chapter 1](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-1/)

It defines the Syntax of the language and it's AST.     
The the output of this stage takes any text file as input. It will give an error if the
content fails/voilates the syntax definition of the toy language. We can use the `-emit=ast`
to pretty-print out the AST of the program in the input file, if it is a valid toy program.

### To Compile
`source ./build-proj.sh $LLVM_INSTALL_DIR`

### To try out
`./build/toyc-ch1 -emit=ast my-program.toy`   

This will print out the AST of the code contained in *my-program.toy*.    
If there is a systax error it will be printed out.
