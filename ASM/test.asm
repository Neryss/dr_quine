section .text
	global _start

_start:
	mov	rax, 4		; system call for write
	mov	rbx, 1		; file descriptor
	mov	rcx, msg	; put offset of hello in ecx (arg for write)
	mov	rdx, len	; len as argument
	int	80h			; Call the kernel to write
	mov	rax, 1		; syscall for exit
	mov	rbx, 0		; return 0
	int	80h			; call kernel to exit

section .data
msg:	db "Hello world!", 10
len:	equ $-msg