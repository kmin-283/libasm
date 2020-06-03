section     .text

global      ft_list_size

ft_list_size:
    xor     rax, rax
    cmp     rdi, 0
    je      end

loop:
    xor     rcx, rcx
    add     rcx, 8
    inc     rax
    mov     rdi, [rdi + rcx]
    cmp     rdi, 0
    je      end
    jmp     loop

end:
    ret