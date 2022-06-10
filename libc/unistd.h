#include <stddef.h>
#include <stdint.h>

#include "things/defs.h"

#ifdef __linux__
#include <asm/unistd.h>
#endif // __linux__

#ifdef _WIN32
// Given a pointer to a system call wrapper function, this will get the system call number for it
extern _LIBC_DLLSYM uint64_t __win32_get_syscall_number(void *__syscall);
#endif // _WIN32

// Make a system call. This is implemented on Windows too, but you need to use __win32_get_syscall_number.
extern _LIBC_DLLSYM uint64_t syscall(uint64_t number, ...);

// Write __n bytes of __buf to __fd
extern _LIBC_DLLSYM uint64_t write(uint64_t __fd, void *__buf, size_t __n);

