#include "add.cuh"

#include <torch/extension.h>
#include <pybind11/pybind11.h>

PYBIND11_MODULE(extension, m) {
    m.def("add", &ext::add, "Add two tensors");
}
