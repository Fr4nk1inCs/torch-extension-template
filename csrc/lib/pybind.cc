#include "add.cuh"

#include <pybind11/pybind11.h>
#include <torch/extension.h>

PYBIND11_MODULE(extension, m) { m.def("add", &ext::add, "Add two tensors"); }
