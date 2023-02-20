;welcome to assembly
global main
extern printf
section .text

print:
	mov	rdi, test
	mov	rsi, 2
	call	printf WRT ..plt
	ret
main:
	push	rbx
	jmp		print
	ret
section .data
test: db "This is a test%d"

