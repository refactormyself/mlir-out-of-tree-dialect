  cmake_minimum_required(VERSION 3.13.4)
  project(standalone-toy-dialect LANGUAGES CXX C)

  set(CMAKE_BUILD_WITH_INSTALL_NAME_DIR ON)

  set(CMAKE_CXX_STANDARD 14 CACHE STRING "C++ standard to conform to")

  find_package(MLIR REQUIRED CONFIG)

  message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
  message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

  set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/bin)
  set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/lib)
  set(MLIR_BINARY_DIR ${CMAKE_BINARY_DIR})

  list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
  list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
  include(TableGen)
  include(AddLLVM)
  include(AddMLIR)
  include(HandleLLVMOptions)
  include(MLIRDetectPythonEnv)

  if(MLIR_ENABLE_BINDINGS_PYTHON)
    include(MLIRDetectPythonEnv)
    mlir_configure_python_dev_packages()
  endif()

  include_directories(${LLVM_INCLUDE_DIRS})
  include_directories(${MLIR_INCLUDE_DIRS})
  include_directories(${PROJECT_SOURCE_DIR}/include)
  include_directories(${PROJECT_BINARY_DIR}/include)

  link_directories(${LLVM_BUILD_LIBRARY_DIR})
  add_definitions(${LLVM_DEFINITIONS})
  add_definitions(${MLIR_DEFINITIONS})

  set(LLVM_LINK_COMPONENTS
    Core
    Support
    nativecodegen
    OrcJIT
  )

  add_executable(toyc-ch6
    toyc.cpp
    parser/AST.cpp
    mlir/MLIRGen.cpp
    mlir/Dialect.cpp
    mlir/LowerToAffineLoops.cpp
    mlir/LowerToLLVM.cpp
    mlir/ShapeInferencePass.cpp
    mlir/ToyCombine.cpp
    
  )

  # build Toy;s TableGen(ated) files as defined at ./include/toy/CMakeLists.txt 
  add_subdirectory(include)
  add_dependencies(toyc-ch6
    ToyCh6ShapeInferenceInterfaceIncGen
    ToyCh6OpsIncGen
    ToyCh6CombineIncGen
  )

  # We have used the Affine Dialect, so
  # acquire the details of dialects that comes with MLIR, so we can link to them
  get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
  get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)

  target_link_libraries(toyc-ch6
    PRIVATE
      ${dialect_libs}
      ${conversion_libs}
      MLIRAnalysis
      MLIRCallInterfaces
      MLIRCastInterfaces
      MLIRExecutionEngine
      MLIRIR
      MLIRLLVMCommonConversion
      MLIRLLVMIR
      MLIRLLVMToLLVMIRTranslation
      MLIRMemRef
      MLIRParser
      MLIRPass
      MLIRSideEffectInterfaces
      MLIRSupport
      MLIRTargetLLVMIRExport
      MLIRTransforms
  )

  target_compile_options(toyc-ch6 
    PUBLIC -fno-rtti
  )

  install(TARGETS toyc-ch6)