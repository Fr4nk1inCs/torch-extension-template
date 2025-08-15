#pragma once

#include <torch/extension.h>

namespace core {
torch::Tensor add(const torch::Tensor &a, const torch::Tensor &b);
} // namespace core
