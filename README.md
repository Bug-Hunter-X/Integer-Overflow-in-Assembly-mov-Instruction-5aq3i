# Integer Overflow Vulnerability in Assembly

This repository demonstrates a potential integer overflow vulnerability in an assembly instruction. The vulnerability arises from the lack of bounds checking in the address calculation of a `mov` instruction.  A large value in the `ecx` register could result in an unexpected memory address being accessed, leading to data corruption or a program crash.  This vulnerability is critical in situations where user input or external data influences the value of the register.

## Vulnerability Details

The vulnerable code is in `bug.asm`. The instruction `mov eax, [ebx + ecx*4]` is the root cause.  If `ecx` is too large, adding it to `ebx` might cause an integer overflow, resulting in the program trying to access an unexpected memory location.  This can lead to unexpected program behavior, including segmentation faults and data corruption.

## Mitigation

The `bugSolution.asm` file demonstrates a mitigation strategy.  A robust solution involves checking the bounds of `ecx` before performing the memory access to prevent overflows.  This involves testing if the addition would result in a value exceeding the limits of the address space.