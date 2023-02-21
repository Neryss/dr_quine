%macro _main 0
global main
extern fprintf
extern open
extern close
open_file:
	push	rbx
	mov		rax, 2
	mov		rdi, filename
	mov		rsi, 2
	syscall
	pop		rbx
	ret
main:
	push	rbx
	pop		rbx
	jmp		open_file
	mov		rax, 3
	syscall
	ret
section .data
filename: db "Grace_kid.c"
%endmacro

_main