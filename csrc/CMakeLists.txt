set(CMAKE_INSTALL_RPATH "$ORIGIN;${TORCH_INSTALL_PREFIX}/lib")
set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)

include_directories(${CMAKE_CURRENT_LIST_DIR}/include)

pybind11_add_module(_core lib/add.cu lib/pybind.cc)

set_target_properties(_core PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
set_target_properties(_core PROPERTIES CUDA_STANDARD 17)
set_target_properties(_core PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_compile_options(
  _core PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:--expt-extended-lambda>)

target_link_libraries(_core PRIVATE pybind11::module torch
                                        ${TORCH_PYTHON_LIBRARY} cuda)

install(TARGETS _core LIBRARY DESTINATION .)
