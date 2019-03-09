section .data
	message db "This is a message from Linux assembly!", 0ah, 0dh

section .text
	global start

; more system calls are provided in:
; http://syscalls.kernelgrok.com/

start:
	; print the message
	;mov rax, 1        ; syscall number for sys_write()
	mov rax, 0x2000004 ; syscall number for sys_write()
	mov rdi, 1         ; standard output
	mov rsi, message   ; what to print
	mov rdx, 40        ; how many characters to print
	syscall

	; exit
	;mov rax, 60       ; syscall number for sys_exit()
	mov rax, 0x2000001 ; syscall number for sys_exit()
	mov rdi, 0         ; exit code (0 means success)
	syscall
