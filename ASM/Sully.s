global main
extern dprintf
extern system
extern asprintf
section .text
main:
	push	rbx
	mov		r12, 5
	call	asprintf_call
	call	check_file
	call	open_file
	;mov		r13, rax
	;call	write_to_file
	;call	close_file
	;mov		rax, 0
	;call	make
	pop		rbx
	ret
check_file:
	mov		rax, 21
	mov		rdi, [r13]
	mov		rsi, 0
	syscall			;doesn't seem to work properly rn (returns unknown things when file doesn't exist and 0 when it does)
	cmp		rax, 0
	jne		quit_check
	ret
quit_check:
	dec		r12
	ret
asprintf_call:
	push	rbx
	mov		rdi, rsp
	lea		rsi, [rel filename]
	mov		rdx, r12
	call	asprintf WRT ..plt
	mov		r13, rsp
	pop		rbx
	ret
write_to_file:
	push	rbx
	mov		rdi, r13
	lea		rsi, [rel code]
	mov		rdx, 10
	;mov		rcx, 34
	;lea		r8, [rel code]
	call	dprintf WRT ..plt
	pop		rbx
	ret
make:
	push	rbx
	lea		rdi, [rel exec]
	call	system WRT ..plt
	pop		rbx
	ret
open_file:
	push	rbx
	mov		rax, 2
	mov		rdi, [r13]
	mov		rsi, 64 + 1
	mov		rdx, 0644o
	syscall
	pop		rbx
	ret
close_file:
	push	rbx
	mov		rdi, r13
	mov		rax, 3
	syscall
	pop		rbx
	ret
section .data
filename: db "Sully_%d.s", 0
code: db "global main%1$csection .text%1$cmain:%1$c	push	rbx%1$c	pop		rbx%1$c	ret", 0
exec: db "echo hey", 0