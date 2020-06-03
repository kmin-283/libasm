section     .text
global      ft_strcpy

; delete RDX, RCX, RAX

ft_strcpy:							; dst = rdi, src = rsi
	xor		rcx, rcx				; i = 0
	cmp		rsi, 0					; !rsi
	je		end
	jmp		copy

increment:
	inc		rcx

copy:
	mov		dl, byte [rsi + rcx]
	mov		byte [rdi + rcx], dl
	cmp		dl, 0
	jne		increment

end:
	mov		rax, rdi				; return dst
	ret