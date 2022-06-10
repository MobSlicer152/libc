; System call wrapper

OPTION PROLOGUE: NONE

.code

__syscall PROC PUBLIC
	push rbp
	mov rbp, rsp

	sub rsp, 32

	mov rax, rcx
	mov r10, rdx ; R10 instead of RCX because that's where the return address gets put by syscall
	mov rdx, r8
	mov r8, r9
	mov r9, QWORD PTR [rsp + 16]
	mov rcx, QWORD PTR [rsp + 24]
	mov QWORD PTR [rsp + 16], rcx
	mov rcx, QWORD PTR [rsp + 32]
	mov QWORD PTR [rsp + 24], rcx

	syscall

	leave
	ret
__syscall ENDP

END
