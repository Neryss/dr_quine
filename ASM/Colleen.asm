;welcome to assembly
global main
extern printf
section .text

print:
	mov	rdi, test
	mov	rsi, 10
	call	printf WRT ..plt
	ret
main:
	push	rbx
	jmp		print
	ret
section .data
test: db "This is a test%1$c, another one%1$c, and a last one%1$c"

