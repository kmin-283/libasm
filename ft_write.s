section     .text

global      ft_write

ft_write:
    cmp     rdx, 0
    jbe     size_error
    cmp     rdi, 0
    jbe     write_error
    cmp     rsi, 0
    je      write_error
    mov     rax, 1      ;on mac "mov rax, 0x2000004"
    syscall
    ret

write_error:
    mov     rax, -1
    ret

size_error:
    mov     rax, 0
    ret