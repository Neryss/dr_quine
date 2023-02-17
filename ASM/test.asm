section .text
	global _start

_start:
	mov	eax, 4		; system call for write
	mov	ebx, 1		; file descriptor
	mov	ecx, msg	; put offset of hello in ecx (arg for write)
	mov	edx, len	; len as argument
	int	80h			; Call the kernel to write
	mov	eax, 1		; syscall for exit
	mov	ebx, 0		; return 0
	int	80h			; call kernel to exit

section .data
msg:	db "Hello world!", 10
len:	equ $-msg