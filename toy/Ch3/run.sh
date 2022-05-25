
MLIR_TUTOR="/DATA/DEV/Compilers/MyProjects/mlir-tutor/"
CHPT=$MLIR_TUTOR/examples/toy

$CHPT/Ch2/bin/bin/toyc-ch2 --emit=mlir $MLIR_TUTOR/my-practices/toy-codes/example_2.toy
$CHPT/Ch3/bin/bin/toyc-ch3 --emit=mlir $MLIR_TUTOR/my-practices/toy-codes/example_2.toy

# "-opt" should no reshape operations remain after canonicalization
$CHPT/Ch3/bin/bin/toyc-ch3 --emit=mlir -opt $MLIR_TUTOR/my-practices/toy-codes/example_2.toy
