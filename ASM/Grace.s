%macro _main 0
global main
extern fprintf
extern open
extern close
open_file:
	push	rbx
	mov		rax, 2
	lea		rdi, [rel filename]
	mov		rsi, 64 + 1
	mov		rdx, 0644o
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
filename: db "Grace_kid.s"
%endmacro

_main