#include "unistd.h"

extern uint64_t _syscall(uint64_t __nr, ...);

_LIBC_DLLSYM uint64_t syscall(uint64_t __nr, ...)
{
	return _syscall(__nr);
}
