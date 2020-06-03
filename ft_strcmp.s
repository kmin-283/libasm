section     .text

global      _ft_strcmp

_ft_strcmp:
    xor     rcx, rcx
    xor     rax, rax
    cmp     rdi, 0
    je      end
    cmp     rsi, 0
    je      end

comparison:
    mov     al, byte [rdi]
	cmp		al, 0
	je		end_str
    mov     cl, byte [rsi]
	cmp		cl, 0
	je		end_str
    inc     rdi
    inc     rsi
    cmp     rax, rcx
	ja		ret_one
	jb		ret_minus_one
    je      comparison

ret_one:
	mov		rax, 1
	jmp		end

ret_minus_one:
	mov		rax, -1
	jmp		end

end_str:
	mov		al, byte [rdi]
	mov		cl, byte [rsi]
	cmp		rax, rcx
	ja		ret_one
	jb		ret_minus_one
	sub		rax, rcx
	jmp		end

end:
    ret
