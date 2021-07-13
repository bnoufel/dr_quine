section .data
	b db "Sully_%d", 0
	p db "Sully_%d.s", 0
	n db "%d", 0
	c db "nasm -f elf64 -DR %1$s.s -o %2$s.o && gcc -Wall -Wextra -Werror -no-pie %2$s.o -o %2$s && ./%2$s", 0
pd:
	.s db "section .data%1$c%5$cb db %2$cSully_%%d%2$c, 0%1$c%5$cp db %2$cSully_%%d.s%2$c, 0%1$c%5$cn db %2$c%%d%2$c, 0%1$c%5$cc db %2$cnasm -f elf64 -DR %%1$s.s -o %%2$s.o && gcc -Wall -Wextra -Werror -no-pie %%2$s.o -o %%2$s && ./%%2$s%2$c, 0%1$cpd:%1$c%5$c.s db %2$c%3$s%2$c, 0%1$c%%ifndef R%1$c%5$c%%define R 0%1$c%%else%1$c%5$c%%define R 1%1$c%%endif%1$c%1$csection .text%1$c%5$cglobal main%1$c%5$cextern asprintf%1$c%5$cextern dprintf%1$c%5$cextern system%1$c%5$cextern free%1$c%1$cquit:%1$c%5$cmov rax, 60 ; syscall exit%1$c%5$csyscall%1$c%5$cleave%1$c%5$cret%1$c%1$cmain:%1$c%5$cpush rbp%1$c%5$cmov rbp, rsp%1$c%5$csub rsp, 0x20%1$c%5$cmov r13, %4$d%1$c%5$ccmp r13, 0%1$c%5$cjle quit%1$c%5$cmov rax, R%1$c%5$csub r13, rax%1$c%5$clea rdi, [rel rsp+0x8]%1$c%5$clea rsi, [rel p]%1$c%5$cmov rdx, r13%1$c%5$cmov al,0x0%1$c%5$ccall asprintf%1$c%5$clea rdi, [rel rsp+0x10]%1$c%5$clea rsi, [rel b]%1$c%5$cmov rdx, r13%1$c%5$cmov al,0x0%1$c%5$ccall asprintf%1$c%5$cmov rax, 2 ; syscall open%1$c%5$cmov rdi, [rel rsp+0x8]%1$c%5$cmov rsi, 0102o%1$c%5$cmov rdx, 0666o%1$c%5$csyscall%1$c%5$cmov [rsp+0x18], rax%1$c%5$clea rdi, [rel rsp+0x20]%1$c%5$clea rsi, [rel c]%1$c%5$cmov rdx, [rel rsp+0x10]%1$c%5$cmov rcx, [rel rsp+0x10]%1$c%5$ccall asprintf%1$c%5$cmov rdi, [rel rsp+0x18]%1$c%5$clea rsi, [rel pd.s]%1$c%5$cmov rdx, 10%1$c%5$cmov rcx, 34%1$c%5$clea r8, [rel pd.s]%1$c%5$cmov r9, r13%1$c%5$cmov word [rsp+0x0], 9%1$c%5$ccall dprintf%1$c%5$cmov rdi, [rel rsp+0x20]%1$c%5$ccall system%1$c%5$cmov rdi, [rel rsp+0x8]%1$c%5$ccall free%1$c%5$cmov rdi, [rel rsp+0x10]%1$c%5$ccall free%1$c%5$cmov rdi, [rel rsp+0x20]%1$c%5$ccall free%1$c%5$cmov rax, 3 ; syscall close%1$c%5$cmov rdi, [rel rsp+0x18]%1$c%5$csyscall%1$c%5$cleave%1$c%5$cret%1$c", 0
%ifndef R
	%define R 0
%else
	%define R 1
%endif

section .text
	global main
	extern asprintf
	extern dprintf
	extern system
	extern free

quit:
	mov rax, 60 ; syscall exit
	syscall
	leave
	ret

main:
	push rbp
	mov rbp, rsp
	sub rsp, 0x20
	mov r13, 5
	cmp r13, 0
	jle quit
	mov rax, R
	sub r13, rax
	lea rdi, [rel rsp+0x8]
	lea rsi, [rel p]
	mov rdx, r13
	mov al,0x0
	call asprintf
	lea rdi, [rel rsp+0x10]
	lea rsi, [rel b]
	mov rdx, r13
	mov al,0x0
	call asprintf
	mov rax, 2 ; syscall open
	mov rdi, [rel rsp+0x8]
	mov rsi, 0102o
	mov rdx, 0666o
	syscall
	mov [rsp+0x18], rax
	lea rdi, [rel rsp+0x20]
	lea rsi, [rel c]
	mov rdx, [rel rsp+0x10]
	mov rcx, [rel rsp+0x10]
	call asprintf
	mov rdi, [rel rsp+0x18]
	lea rsi, [rel pd.s]
	mov rdx, 10
	mov rcx, 34
	lea r8, [rel pd.s]
	mov r9, r13
	mov word [rsp+0x0], 9
	call dprintf
	mov rdi, [rel rsp+0x20]
	call system
	mov rdi, [rel rsp+0x8]
	call free
	mov rdi, [rel rsp+0x10]
	call free
	mov rdi, [rel rsp+0x20]
	call free
	mov rax, 3 ; syscall close
	mov rdi, [rel rsp+0x18]
	syscall
	leave
	ret
