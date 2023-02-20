;welcome to assembly
global main
extern printf
section .text
main:
	push	rbx
	mov		rdi, test
	call	printf WRT ..plt
	ret
section .data
test: db "This is a test"

