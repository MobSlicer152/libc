// System call wrapper

#include "things/defs.h"

.global syscall
syscall:
	pushq %rbp
	movq %rsp, %rbp

	movq %rdi, %rax
	movq %rsi, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	movq %r8, %r10 // R10 instead of RCX because syscall uses RCX for the return address
	movq %r9, %r8
	mov 16(%rsp), %r9

	syscall

	leave
	retq

