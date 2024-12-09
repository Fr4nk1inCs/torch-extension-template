#include "add.cuh"

#include <ATen/Dispatch.h>
#include <torch/extension.h>

using torch::Tensor;

template <typename scalar_t>
__global__ void add_kernel(const scalar_t *a, const scalar_t *b, scalar_t *c,
                           size_t size) {
  int index = blockIdx.x * blockDim.x + threadIdx.x;
  if (index < size) {
    c[index] = a[index] + b[index];
  }
}

Tensor ext::add(const Tensor &a, const Tensor &b) {
  auto a_contig = a.contiguous();
  auto b_contig = b.contiguous();
  auto c = torch::empty_like(a);

  const int threads = 1024;
  const int blocks = (a.numel() + threads - 1) / threads;

  AT_DISPATCH_FLOATING_TYPES(a.scalar_type(), "add_cuda", ([&] {
                               add_kernel<scalar_t><<<blocks, threads>>>(
                                   a_contig.const_data_ptr<scalar_t>(),
                                   b_contig.const_data_ptr<scalar_t>(),
                                   c.mutable_data_ptr<scalar_t>(), a.numel());
                             }));

  return c;
}
