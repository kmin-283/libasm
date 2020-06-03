section     .text

global      _ft_strcpy

_ft_strcpy:							; dst = rdi, src = rsi
	xor		rcx, rcx				; i = 0
	xor		rax, rax
	cmp		rsi, 0					; !rsi
	je		null
	jmp		copy

increment:
	inc		rcx

copy:
	mov		dl, byte [rsi + rcx]
	mov		byte [rdi + rcx], dl
	cmp		dl, 0
	je		end
	jmp		increment

null:
	mov		rdi, rax

end:
	mov		rax, rdi				; return dst
	ret
