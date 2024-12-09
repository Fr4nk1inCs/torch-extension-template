#pragma once

#include <torch/extension.h>

namespace ext {
torch::Tensor add(const torch::Tensor &a, const torch::Tensor &b);
} // namespace ext
