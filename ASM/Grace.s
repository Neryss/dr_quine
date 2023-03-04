;this is a comment
global main
extern dprintf
%macro _main 0
main:
	push	rbx
	call	open_file
	mov		r12, rax
	call	write_to_file
	call	close_file
	mov		rax, 0
	pop		rbx
	ret
write_to_file:
	push	rbx
	mov		rdi, r12
	lea		rsi, [rel code]
	mov		rdx, 10
	mov		rcx, 34
	lea		r8, [rel code]
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
	push	rbx
	mov		rdi, r12
	mov		rax, 3
	syscall
	pop		rbx
	ret
%endmacro
_main
section .data
filename: db "Grace_kid.s", 0
code: db ";this is a comment%1$cglobal main%1$cextern dprintf%1$c%%macro _main 0%1$cmain:%1$c	push	rbx%1$c	call	open_file%1$c	mov		r12, rax%1$c	call	write_to_file%1$c	call	close_file%1$c	mov		rax, 0%1$c	pop		rbx%1$c	ret%1$cwrite_to_file:%1$c	push	rbx%1$c	mov		rdi, r12%1$c	lea		rsi, [rel code]%1$c	mov		rdx, 10%1$c	mov		rcx, 34%1$c	lea		r8, [rel code]%1$c	call	dprintf WRT ..plt%1$c	pop		rbx%1$c	ret%1$copen_file:%1$c	push	rbx%1$c	mov		rax, 2%1$c	lea		rdi, [rel filename]%1$c	mov		rsi, 64 + 1%1$c	mov		rdx, 0644o%1$c	syscall%1$c	pop		rbx%1$c	ret%1$cclose_file:%1$c	push	rbx%1$c	mov		rdi, r12%1$c	mov		rax, 3%1$c	syscall%1$c	pop		rbx%1$c	ret%1$c%%endmacro%1$c_main%1$csection .data%1$cfilename: db %2$cGrace_kid.s%2$c, 0%1$ccode: db %2$c%3$s%2$c, 0%1$c", 0
