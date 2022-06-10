// Linux x86-64 startup

.section .text

.extern __libc_linux_start

.global _start
_start:
	movq (%rsp), %rdi // argc
	leaq 8(%rsp), %rsi // argv

	call __libc_linux_start

