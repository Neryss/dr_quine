global main
extern dprintf
extern system
extern asprintf
extern sprintf
extern free
section .text
main:
	mov		r12, 5

	call	asprintf_call
	call	check_file
	;call	open_file
	;mov		r13, rax
	;call	write_to_file
	;call	close_file
	;call	make
	mov		rax, 0
asprintf_call:
	lea		rdi, [r13]
	mov		rsi, filename
	mov		rdx, r12
	call	asprintf
check_file:
	mov		rax, 21
	mov		rdi, [r13]
	mov		rsi, 0
	syscall			;(returns unknown values when file doesn't exist and 0 when it does)
	cmp		rax, 0
	jne		asprintf_call2
quit_check:
	dec		r12
asprintf_call2:
	lea		rdi, [r13]
	mov		rsi, filename
	mov		rdx, r12
	call	asprintf
open_file:
	mov		rax, 2
	mov		rdi, [r13]
	mov		rsi, 64 + 1
	mov		rdx, 0644o
	syscall
write_to_file:
	mov		rdi, r13
	lea		rsi, [rel code]
	mov		rdx, 10
	;mov		rcx, 34
	;lea		r8, [rel code]
	call	dprintf
	mov		rax, 60
	mov		rdi, 0
	syscall
make:
	lea		rdi, [rel exec]
	call	system
	ret
close_file:
	mov		rdi, r13
	mov		rax, 3
	syscall
	ret
section .data
filename: db "Sully_%d.s", 0
buffer: db "Sully_x.s", 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
code: db "global main%1$csection .text%1$cmain:%1$c	push	rbx%1$c	pop		rbx%1$c	ret", 0
exec: db "echo hey", 0