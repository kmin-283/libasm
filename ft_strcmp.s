section     .text

global      ft_strcmp

ft_strcmp:
    xor     rcx, rcx
    xor     rax, rax
    cmp     rdi, 0
    je      end
    cmp     rsi, 0
    je      end

comparison:
    mov     al, byte [rdi]
    mov     cl, byte [rsi]
    inc     rdi
    inc     rsi
    sub     rax, rcx
    jz      comparison

end:
    ret