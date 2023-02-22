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
	call	open_file
	mov		rdi, rax
	mov		rax, 1
	lea		rsi, [rel filename]
	mov		rdx, len
	syscall
	mov		rdi, rax
	mov		rax, 3
	syscall
	mov		rax, 0
	pop		rbx
	ret
section .data
filename: db "Grace_kid.s"
len: equ $-filename
%endmacro

_main