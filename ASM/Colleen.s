;welcome to assembly
global main
extern printf
section .text
print:
	push	rbx
	lea		rdi, [rel code]
	mov		rsi, 10
	mov		rdx, 34
	lea		rcx, [rel code]
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
code: db ";welcome to assembly%1$cglobal main%1$cextern printf%1$csection .text%1$cprint:%1$c	push	rbx%1$c	lea		rdi, [rel code]%1$c	mov		rsi, 10%1$c	mov		rdx, 34%1$c	lea		rcx, [rel code]%1$c	call	printf WRT ..plt%1$c	pop		rbx%1$c	ret%1$cmain:%1$c	push	rbx%1$c	call	print%1$c	pop		rbx%1$c	mov		rax, 0%1$c	;inside comment%1$c	ret%1$csection .data%1$ccode: db %2$c%3$s%2$c%1$c"
