section     .text

global      ft_atoi_base

ft_atoi_base:
    xor     r12, r12
    xor     r13, r13
    cmp     rdi, 0
    je      end
    cmp     byte [rdi + r12], 0
    je      end
    cmp     byte [rdi + r12], 45
    je      minus
    call    check_str1

minus:
    inc     r12

check_str1:
    cmp     byte [rdi + r12], 0
    je      check_base1
    cmp     byte [rdi + r12], 48
    jae     check_str2
    jmp     end

check_str2:
    cmp     byte [rdi + r12], 57
    jbe     check_str3
    jmp     end

check_str3:
    inc     r12
    jmp     check_str1

check_base1:
    cmp     rsi, 0
    je      end
    cmp     byte [rsi + r13], 0
    je      end
    jmp     check_base2

check_base_dup:
    cmp     byte [rsi + rcx], byte [rsi + r13]
    je      end
    cmp     rcx, r13
    je      check_base2
    inc     rcx
    jmp     check_base_dup

check_base2:
    cmp     byte [rsi + r13], 0
    je      main
    cmp     byte [rsi + r13], 43    ;+
    je      end
    cmp     byte [rsi + r13], 45    ;-
    je      end
    cmp     byte [rsi + r13], 32    ;' '
    je      end
    cmp     byte [rsi + r13], 9     ;'\t'
    je      end
    cmp     byte [rsi + r13], 10    ;'\n'
    je      end
    cmp     byte [rsi + r13], 11    ;'\r'
    je      end
    cmp     byte [rsi + r13], 12    ;'\v'
    je      end
    cmp     byte [rsi + r13], 43    ;'\f'
    je      end
    xor     rcx, rcx
    inc     r13
    jmp     check_base_dup



end:
    mov     rax, 0
    ret