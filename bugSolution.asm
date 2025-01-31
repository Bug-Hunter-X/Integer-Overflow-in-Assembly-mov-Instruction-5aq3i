; Check for potential integer overflow before accessing memory
mov eax, ecx
; Assuming 32-bit addresses
cmp eax, 0x7FFFFFFF ; check upper bound
ja overflow_error ; jump to error handling if overflow detected
cmp eax, 0x80000000 ; check lower bound
jl overflow_error ; jump to error handling if overflow detected
mov eax, [ebx + ecx*4] ; Safe access to memory only if no overflow detected
jmp next_instruction ; jump to the next instruction

overflow_error:
; Handle the overflow error (e.g., return an error code)
mov eax, -1 ; Set a error code
ret ; Return from the function

next_instruction: