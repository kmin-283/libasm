section     .text

global      _ft_write

_ft_write:
    cmp     rdx, 0
    jb		size_error
    cmp     rdi, 0
    jb		write_error
    cmp     rsi, 0
    je      write_error
	push	rsi
	push	rdx
	mov		rsi, 0
	mov		rax, 0x20000BD		;syscall fstat, check for fd is valid
	syscall
	pop		rdx
	pop		rsi
	cmp		rax, 9
	je		write_error
    mov     rax, 0x2000004      ;on mac "mov rax, 0x2000004"
    syscall
	jmp		end

write_error:
    mov     rax, -1
    jmp		end

size_error:
    mov     rax, 0
	jmp		end

end:
	ret
