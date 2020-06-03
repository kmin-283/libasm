section     .text

global      ft_list_remove_if
extern      free

ft_list_remove_if:
    xor     rax, rax
    xor     rbx, rbx
    cmp     rdi, 0
    je      end
    cmp     qword [rdi], 0            ;1st - RDI, 2nd - RSI, 3rd - RDX, 4th - RCX
    je      end
    jmp     next

comparing:
    call    rdx
    cmp     rax, 0
    je      free_fct
    pop     rsi
    pop     rdi
    mov     rbx, rdi
    mov     rdi, [rdi + 8]
    cmp     rdi, 0
    je      end
    jmp     next

free_fct:
    mov     rdi, [rdi]
    call    rcx
    pop     rsi
    pop     rdi
    mov     r13, [rdi + 8]
    mov     rdi, [rdi]
    call    free
    cmp     rbx, 0
    je      first_node
    jmp     not_first_node

first_node:
    mov     rdi, r13
    jmp     next

not_first_node:
    mov     [rbx + 8], r13
    mov     r14, [rbx + 8]
    mov     rdi, r14

next:
    push    rdi
    push    rsi
    mov     rdi, [rdi]
    mov     rsi, [rsi]
    jmp     comparing

end:
    ret