section     .text

global      ft_read

ft_read:
    cmp     rdx, 0
    jbe     size_error
    cmp     rdi, 0
    jbe     read_error
    cmp     rsi, 0
    je      read_error
    mov     rax, 0      ;using mac "mov     rax, 0x2000003"
    syscall
    ret

read_error:
    mov     rax, -1
    ret

size_error:
    mov     rax, 0
    ret