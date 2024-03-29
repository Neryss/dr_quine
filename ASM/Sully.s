section .text
global main
extern free
extern dprintf
extern system
extern asprintf
extern sprintf
main:
	mov		r12, 5
	cmp		r12, 0
	jl		sys_exit
	push	rbx
	call	asprintf_call
	call	check_file
	call	open_file
	call	write_to_file
	call	close_file
	pop		rbx
	cmp		r12, 0
	ja		make
	call	sys_exit
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
	push	rbx
	mov		rax, 21
	mov		rdi, [r13]
	mov		rsi, 0
	syscall
	pop		rbx
	cmp		rax, 0
	je		file_exists
	ret
file_exists:
	push	rbx
	dec		r12
	call	asprintf_call
	pop		rbx
	ret
open_file:
	push	rbx
	mov		rax, 2
	mov		rdi, [r13]
	mov		rsi, 64 + 1
	mov		rdx, 0644o
	syscall
	push	rax
	mov		rdi, [r13]
	call	free
	pop		r13
	pop		rbx
	ret
write_to_file:
	push	rbx
	mov		rdi, r13
	lea		rsi, [code]
	mov		rdx, 10
	mov		rcx, 34
	lea		r8, [code]
	mov		r9, r12
	call	dprintf
	pop		rbx
	ret
make:
	push	rbx
	mov		rdi, rsp
	lea		rsi, [exec]
	mov		rdx, r12
	call	asprintf
	mov		rdi, [rsp]
	call	system
	pop		rbx
	ret
close_file:
	push	rbx
	mov		rdi, r13
	mov		rax, 3
	syscall
	pop		rbx
	ret
sys_exit:
	mov		rax, 60
	mov		rdi, 0
	syscall
section .data
filename: db "Sully_%d.s", 0
code: db "section .text%1$cglobal main%1$cextern free%1$cextern dprintf%1$cextern system%1$cextern asprintf%1$cextern sprintf%1$cmain:%1$c	mov		r12, %4$d%1$c	cmp		r12, 0%1$c	jl		sys_exit%1$c	push	rbx%1$c	call	asprintf_call%1$c	call	check_file%1$c	call	open_file%1$c	call	write_to_file%1$c	call	close_file%1$c	pop		rbx%1$c	cmp		r12, 0%1$c	ja		make%1$c	call	sys_exit%1$casprintf_call:%1$c	push	rbx%1$c	mov		rdi, rsp%1$c	lea		rsi, [filename]%1$c	mov		rdx, r12%1$c	call	asprintf%1$c	mov		r13, rsp%1$c	pop		rbx%1$c	ret%1$ccheck_file:%1$c	push	rbx%1$c	mov		rax, 21%1$c	mov		rdi, [r13]%1$c	mov		rsi, 0%1$c	syscall%1$c	pop		rbx%1$c	cmp		rax, 0%1$c	je		file_exists%1$c	ret%1$cfile_exists:%1$c	push	rbx%1$c	dec		r12%1$c	call	asprintf_call%1$c	pop		rbx%1$c	ret%1$copen_file:%1$c	push	rbx%1$c	mov		rax, 2%1$c	mov		rdi, [r13]%1$c	mov		rsi, 64 + 1%1$c	mov		rdx, 0644o%1$c	syscall%1$c	push	rax%1$c	mov		rdi, [r13]%1$c	call	free%1$c	pop		r13%1$c	pop		rbx%1$c	ret%1$cwrite_to_file:%1$c	push	rbx%1$c	mov		rdi, r13%1$c	lea		rsi, [code]%1$c	mov		rdx, 10%1$c	mov		rcx, 34%1$c	lea		r8, [code]%1$c	mov		r9, r12%1$c	call	dprintf%1$c	pop		rbx%1$c	ret%1$cmake:%1$c	push	rbx%1$c	mov		rdi, rsp%1$c	lea		rsi, [exec]%1$c	mov		rdx, r12%1$c	call	asprintf%1$c	mov		rdi, [rsp]%1$c	call	system%1$c	pop		rbx%1$c	ret%1$cclose_file:%1$c	push	rbx%1$c	mov		rdi, r13%1$c	mov		rax, 3%1$c	syscall%1$c	pop		rbx%1$c	ret%1$csys_exit:%1$c	mov		rax, 60%1$c	mov		rdi, 0%1$c	syscall%1$csection .data%1$cfilename: db %2$cSully_%%d.s%2$c, 0%1$ccode: db %2$c%3$s%2$c, 0%1$cexec: db %2$cnasm -felf64 Sully_%%1$d.s; gcc -no-pie -o Sully_%%1$d Sully_%%1$d.o && rm Sully_%%1$d.o; ./Sully_%%1$d%2$c, 0", 0
exec: db "nasm -felf64 Sully_%1$d.s; gcc -no-pie -o Sully_%1$d Sully_%1$d.o && rm Sully_%1$d.o; ./Sully_%1$d", 0