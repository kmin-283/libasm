section     .text

extern      _malloc

global      _ft_strdup

_ft_strdup:
    xor     rax, rax
    cmp     rdi, 0
    je      null

_strlen:
    cmp     byte [rdi + rax], 0
    je      allocation
    inc     rax
    jmp     _strlen

allocation:
    push    rdi
    inc     rax
    mov     rdi, rax
    call    _malloc
    cmp     rax, 0
    je      null
    pop     rdi
    mov     rcx, 0

copy:
    xor     rdx, rdx
    mov     dl, byte [rdi + rcx]
    mov     byte [rax + rcx], dl
    cmp     dl, 0
    je      null
    inc     rcx
    jmp     copy

null:
    ret
