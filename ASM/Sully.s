global main
extern dprintf
extern system
extern asprintf
extern sprintf
extern free
section .text
main:
	push	rbx
	mov		r12, 5
	call	create_filename
	mov		rax, 60
	mov		rax, 0
	syscall
create_filename:
	push	rbx
	lea		rdi, [filename]
	lea		rsi, [fileformat]
	mov		rdx, r12
	call	sprintf
	pop		rbx
	ret
check_file:
	mov		rax, 21
	mov		rdi, [r13]
	mov		rsi, 0
	syscall			;(returns unknown values when file doesn't exist and 0 when it does)
	cmp		rax, 0
quit_check:
	dec		r12
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
filename: db "Sully_X.s",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
fileformat: db "Sully_%d.s", 0
exec_buff: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
code: db "global main%1$csection .text%1$cmain:%1$c	push	rbx%1$c	pop		rbx%1$c	ret", 0