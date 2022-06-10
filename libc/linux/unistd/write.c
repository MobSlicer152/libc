#include "unistd.h"

_LIBC_DLLSYM uint64_t write(uint64_t __fd, void *__buf, size_t __n)
{
	return syscall(__NR_write, __fd, __buf, __n);
}

