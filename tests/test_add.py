import extension
import torch


def test():
    a = torch.ones(1024, 1024).cuda()
    b = torch.ones(1024, 1024).cuda()
    c = extension.add(a, b)
    assert torch.all(c == 2)


if __name__ == "__main__":
    test()
    print("Test passed")
