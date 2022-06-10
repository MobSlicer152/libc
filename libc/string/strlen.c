#include "string.h"

_LIBC_DLLSYM size_t strlen(const char *__str)
{
	size_t __i = 0;

	while (__str[__i++])
		;

	return __i;
}
