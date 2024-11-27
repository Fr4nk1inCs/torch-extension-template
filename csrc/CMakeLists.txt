include_directories(${CMAKE_CURRENT_LIST_DIR}/include)

pybind11_add_module(extension
    lib/add.cu
    lib/pybind.cc
)

set_target_properties(extension PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
set_target_properties(extension PROPERTIES CUDA_STANDARD 17)
set_target_properties(extension PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_compile_options(extension PRIVATE
    $<$<COMPILE_LANGUAGE:CUDA>:--expt-extended-lambda>
)

target_link_libraries(extension PRIVATE
    pybind11::module
    torch
    ${TORCH_PYTHON_LIBRARY}
    cuda
)

install(TARGETS extension LIBRARY DESTINATION .)
