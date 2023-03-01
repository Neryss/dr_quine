global main
extern dprintf
extern system
extern asprintf
extern sprintf
extern free
section .text
main:
	mov		r12, 5
	push	rbx
	call	asprintf_call
	call	check_file
	mov		rdi, rax
	mov		rax, 60
	pop		rbx
	syscall
asprintf_call:
	push	rbx
	mov		rdi, rsp
	lea		rsi, [filename]
	mov		rdx, r12
	call	asprintf
	mov		r13, rsp
	pop		rbx
	ret
check_file:
	mov		rax, 21
	mov		rdi, [r13]
	mov		rsi, 0
	syscall			;(returns unknown values when file doesn't exist and 0 when it does)
	ret
open_file:
	mov		rax, 2
	mov		rdi, [r13]
	mov		rsi, 64 + 1
	mov		rdx, 0644o
	syscall
	mov		r13, rax
write_to_file:
	mov		rdi, r13
	mov		rsi, [code]
	mov		rdx, 10
	mov		rcx, 34
	;mov		r8, [code]
	call	dprintf
;make:
;	lea		rdi, [rel exec]
;	call	system
;	ret
close_file:
	mov		rdi, r13
	mov		rax, 3
	syscall
	mov		rax, 60
	mov		rdi, 0
	syscall
sys_exit:
	mov		rax, 60
	mov		rdi, 0
	syscall
section .data
filename: db "Sully_%d.s", 0
code: db "global main%1$csection .text%1$cmain:%1$c	push	rbx%1$c	pop		rbx%1$c	ret", 0
exec: db "echo hey", 0