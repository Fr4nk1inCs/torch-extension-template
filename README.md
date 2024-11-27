# Torch CUDA/C++ Extension Template

A template for building a PyTorch CUDA/C++ extension.

Inspired by [gpzlx1/pytorch-extension-demo-v2](https://github.com/gpzlx1/pytorch-extension-demo-v2).

## Installation

```console
$ pip install .
```

Or with `--editable`:

```console
$ pip install -e .
```

## Structure

- `csrc`: C++ & CUDA source files.
  - `include`: Header files.
  - `lib`: Implementation files.
- `python`: Python stub files.
- `scripts`: Scripts used for cmake build system.
- `tests`: Test python scripts.
