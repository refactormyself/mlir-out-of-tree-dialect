
# Toy Language, from the [MLIR Tutoria](https://mlir.llvm.org/docs/Tutorials/Toy/)

This is the implementation of [Chapter 1](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-1/)

It defines the Syntax of the language and it's AST.

### To Compile
`source ./build-proj.sh`

### To try out
`./bin/bin/toyc-ch1 -emit=ast my-program.toy`   

This will print out the AST of the code contained in *my-program.toy*.    
If there is a systax error it will be printed out.
