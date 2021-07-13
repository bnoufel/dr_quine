%define DECLARE_MAIN global main
%define CALL_MAIN main:
%define NAME "Grace_kid.s", 0
section .data
p:
	.file db NAME
	.str db "%%define DECLARE_MAIN global main%1$c%%define CALL_MAIN main:%1$c%%define NAME %3$cGrace_kid.s%3$c, 0%1$csection .data%1$cp:%1$c%2$c.file db NAME%1$c%2$c.str db %3$c%4$s%3$c, 0%1$csection .text%1$c%2$cextern dprintf%1$c%2$cDECLARE_MAIN%1$c_start:%1$c%2$cCALL_MAIN%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp ; YOUPI%1$c%2$csub rsp, 16%1$c%2$cmov rax, 2%1$c%2$clea rdi, [rel p.file]%1$c%2$cmov rsi, 0102o%1$c%2$cmov rdx, 0666o%1$c%2$csyscall%1$c%2$cmov r10, rax%1$c%2$cmov rdi, r10%1$c%2$clea rsi, [rel p.str]%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$clea r9, [rel p.str]%1$c%2$ccall dprintf%1$c%2$cmov rax, 3%1$c%2$cmov rdi, r10%1$c%2$csyscall%1$c%2$cleave%1$c%2$cret%1$c", 0
section .text
	extern dprintf
	DECLARE_MAIN
_start:
	CALL_MAIN
	push rbp
	mov rbp, rsp ; YOUPI
	sub rsp, 16
	mov rax, 2
	lea rdi, [rel p.file]
	mov rsi, 0102o
	mov rdx, 0666o
	syscall
	mov r10, rax
	mov rdi, r10
	lea rsi, [rel p.str]
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	lea r9, [rel p.str]
	call dprintf
	mov rax, 3
	mov rdi, r10
	syscall
	leave
	ret
