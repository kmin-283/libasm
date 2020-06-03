section		.text

global		ft_strlen

ft_strlen:
	mov		rax, rdi			;copy first argument to return val 

comparison:
	cmp		byte [rax], 0		;byte[] == char (1 byte)
	je		end
	inc		rax	
	jne		comparison

end:
	sub		rax, rdi
	ret