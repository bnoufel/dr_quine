section .data
; one comment
print:
	.msg db "section .data%1$c; one comment%1$cprint:%1$c%2$c.msg db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$c%2$cglobal main%1$c%2$cextern printf%1$c%1$cp:%1$c%2$clea rdi, [rel print.msg]%1$c%2$cmov rsi, 10%1$c%2$cmov rdx, 9%1$c%2$cmov rcx, 34%1$c%2$clea r8, [rel print.msg]%1$c%2$ccall printf%1$c%2$cleave%1$c%2$cret%1$c%1$cmain:%1$c%2$cpush rbp; another ?%1$c%2$cmov rbp, rsp%1$c%2$csub rsp, 16%1$c%2$cjmp p%1$c%2$cret%1$c", 0

section .text
	global main
	extern printf

p:
	lea rdi, [rel print.msg]
	mov rsi, 10
	mov rdx, 9
	mov rcx, 34
	lea r8, [rel print.msg]
	call printf
	leave
	ret

main:
	push rbp; another ?
	mov rbp, rsp
	sub rsp, 16
	jmp p
	ret
