#include "add.cuh"

#include <pybind11/pybind11.h>
#include <torch/extension.h>

PYBIND11_MODULE(_core, m) { m.def("add", &core::add, "Add two tensors"); }
