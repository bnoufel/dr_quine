section .data
	b db "Sully_%d", 0
	p db "Sully_%d.s", 0
	n db "%d", 0
	c db "nasm -f macho64 -DR %1$s.s -o %2$s.o && ld %2$s.o -macosx_version_min 10.8 -lSystem -o %2$s && ./%2$s", 0
pd:
	.s db "section .data%1$c%5$cb db %2$cSully_%%d%2$c, 0%1$c%5$cp db %2$cSully_%%d.s%2$c, 0%1$c%5$cn db %2$c%%d%2$c, 0%1$c%5$cc db %2$cnasm -f macho64 -DR %%1$s.s -o %%2$s.o && ld %%2$s.o -macosx_version_min 10.8 -lSystem -o %%2$s && ./%%2$s%2$c, 0%1$cpd:%1$c%5$c.s db %2$c%3$s%2$c, 0%1$c%%ifndef R%1$c%5$c%%define R 0%1$c%%else%1$c%5$c%%define R 1%1$c%%endif%1$c%1$csection .text%1$c%5$cglobal _main%1$c%5$cextern _asprintf%1$c%5$cextern _dprintf%1$c%5$cextern _system%1$c%5$cextern _free%1$c%1$cquit:%1$c%5$cmov rax, 0x2000001%1$c%5$csyscall%1$c%5$cleave%1$c%5$cret%1$c%1$c_main:%1$c%5$cpush rbp%1$c%5$cmov rbp, rsp%1$c%5$csub rsp, 0x20%1$c%5$cmov r13, %4$d%1$c%5$ccmp r13, 0%1$c%5$cjle quit%1$c%5$cmov rax, R%1$c%5$csub r13, rax%1$c%5$clea rdi, [rel rsp+0x8]%1$c%5$clea rsi, [rel p]%1$c%5$cmov rdx, r13%1$c%5$cmov al,0x0%1$c%5$ccall _asprintf%1$c%5$clea rdi, [rel rsp+0x10]%1$c%5$clea rsi, [rel b]%1$c%5$cmov rdx, r13%1$c%5$cmov al,0x0%1$c%5$ccall _asprintf%1$c%5$cmov rax, 0x2000005%1$c%5$cmov rdi, [rel rsp+0x8]%1$c%5$cmov rsi, 0x0202%1$c%5$cmov rdx, 0777o%1$c%5$csyscall%1$c%5$cmov [rsp+0x18], rax%1$c%5$clea rdi, [rel rsp+0x20]%1$c%5$clea rsi, [rel c]%1$c%5$cmov rdx, [rel rsp+0x10]%1$c%5$cmov rcx, [rel rsp+0x10]%1$c%5$ccall _asprintf%1$c%5$cmov rdi, [rel rsp+0x18]%1$c%5$clea rsi, [rel pd.s]%1$c%5$cmov rdx, 10%1$c%5$cmov rcx, 34%1$c%5$clea r8, [rel pd.s]%1$c%5$cmov r9, r13%1$c%5$cmov word [rsp+0x0], 9%1$c%5$ccall _dprintf%1$c%5$cmov rdi, [rel rsp+0x20]%1$c%5$ccall _system%1$c%5$cmov rdi, [rel rsp+0x8]%1$c%5$ccall _free%1$c%5$cmov rdi, [rel rsp+0x10]%1$c%5$ccall _free%1$c%5$cmov rdi, [rel rsp+0x20]%1$c%5$ccall _free%1$c%5$cmov rax, 0x2000006%1$c%5$cmov rdi, [rel rsp+0x18]%1$c%5$csyscall%1$c%5$cleave%1$c%5$cret%1$c", 0
%ifndef R
	%define R 0
%else
	%define R 1
%endif

section .text
	global _main
	extern _asprintf
	extern _dprintf
	extern _system
	extern _free

quit:
	mov rax, 0x2000001
	syscall
	leave
	ret

_main:
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
	call _asprintf
	lea rdi, [rel rsp+0x10]
	lea rsi, [rel b]
	mov rdx, r13
	mov al,0x0
	call _asprintf
	mov rax, 0x2000005
	mov rdi, [rel rsp+0x8]
	mov rsi, 0x0202
	mov rdx, 0777o
	syscall
	mov [rsp+0x18], rax
	lea rdi, [rel rsp+0x20]
	lea rsi, [rel c]
	mov rdx, [rel rsp+0x10]
	mov rcx, [rel rsp+0x10]
	call _asprintf
	mov rdi, [rel rsp+0x18]
	lea rsi, [rel pd.s]
	mov rdx, 10
	mov rcx, 34
	lea r8, [rel pd.s]
	mov r9, r13
	mov word [rsp+0x0], 9
	call _dprintf
	mov rdi, [rel rsp+0x20]
	call _system
	mov rdi, [rel rsp+0x8]
	call _free
	mov rdi, [rel rsp+0x10]
	call _free
	mov rdi, [rel rsp+0x20]
	call _free
	mov rax, 0x2000006
	mov rdi, [rel rsp+0x18]
	syscall
	leave
	ret
