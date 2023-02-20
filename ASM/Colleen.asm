;welcome to assembly
global main
extern printf
section .text
; why all the magic stuff with rbx¿¿¿¿
print:
	push	rbx
	mov		rdi, test
	mov		rsi, 10
	call	printf WRT ..plt
	pop		rbx
	ret
main:
	push	rbx
	call	print
	pop		rbx
	ret
section .data
test: db "This is a test%1$c, another one%1$c, and a last one%1$c"

