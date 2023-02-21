;welcome to assembly
global main
extern printf
section .text
print:
	push	rbx
	mov		rdi, test
	mov		rsi, 10
	mov		rdx, 34
	mov		rcx, test
	call	printf WRT ..plt
	pop		rbx
	ret
main:
	push	rbx
	call	print
	pop		rbx
	mov		rax, 0
	;inside comment
	ret
section .data
test: db ";welcome to assembly%1$cglobal main%1$cextern printf%1$csection .text%1$cprint:%1$c	push	rbx%1$c	mov		rdi, test%1$c	mov		rsi, 10%1$c	mov		rdx, 34%1$c	mov		rcx, test%1$c	call	printf WRT ..plt%1$c	pop		rbx%1$c	ret%1$cmain:%1$c	push	rbx%1$c	call	print%1$c	pop		rbx%1$c	mov		rax, 0%1$c	;inside comment%1$c	ret%1$csection .data%1$ctest: db %2$c%3$s%2$c%1$c"
