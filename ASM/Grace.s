global main
extern dprintf
%macro _main 0
main:
	push	rbx
	call	open_file
	push	rax
	call	write_to_file
	pop		rax
	;call	close_file
	;mov	rax, 0
	pop		rbx
	ret
%endmacro
write_to_file:
	push	rbx
	mov		rdi, rax
	lea		rsi, [rel code]
	mov		rdx, 10
	call	dprintf WRT ..plt
	pop		rbx
	ret
open_file:
	push	rbx
	mov		rax, 2
	lea		rdi, [rel filename]
	mov		rsi, 64 + 1
	mov		rdx, 0644o
	syscall
	pop		rbx
	ret
close_file:
	pop		rdi
	push	rbx
	mov		rax, 3
	syscall
	pop		rbx
	ret
_main
section .data
filename: db "Grace_kid.s", 0
code: db "This is a test%1$c", 0
