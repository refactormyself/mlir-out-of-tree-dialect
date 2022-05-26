
MLIR_TUTOR="/DATA/DEV/Compilers/MyProjects/mlir-tutor/"
CHPT=$MLIR_TUTOR/examples/toy

$CHPT/Ch2/bin/bin/toyc-ch2 --emit=mlir $MLIR_TUTOR/my-practices/toy-codes/example_2.toy
$CHPT/Ch3/bin/bin/toyc-ch3 --emit=mlir $MLIR_TUTOR/my-practices/toy-codes/example_2.toy
echo
echo "CHAPTER 3: "
echo "********-----*********-------*********"
# "-opt" should no reshape operations remain after canonicalization
$CHPT/Ch3/bin/bin/toyc-ch3 --emit=mlir -opt $MLIR_TUTOR/my-practices/toy-codes/example_5.toy

echo
echo "CHAPTER 4: "
echo "********-----*********-------*********"
# 
$CHPT/Ch4/bin/bin/toyc-ch4 --emit=mlir -opt $MLIR_TUTOR/my-practices/toy-codes/example_5.toy

echo
echo "CHAPTER 5: "
echo "********-----*********-------*********"
echo TOY MLIR IR 
$CHPT/Ch5/bin/bin/toyc-ch5 --emit=mlir  $MLIR_TUTOR/my-practices/toy-codes/example_5.toy
echo
echo TOY MLIR IR + OPT
$CHPT/Ch5/bin/bin/toyc-ch5 --emit=mlir -opt $MLIR_TUTOR/my-practices/toy-codes/example_5.toy
echo
echo TOY AFFINE IR
$CHPT/Ch5/bin/bin/toyc-ch5 --emit=mlir-affine $MLIR_TUTOR/my-practices/toy-codes/example_5.toy
echo
echo TOY AFFINE IR + OPT
$CHPT/Ch5/bin/bin/toyc-ch5 --emit=mlir-affine -opt $MLIR_TUTOR/my-practices/toy-codes/example_5.toy

