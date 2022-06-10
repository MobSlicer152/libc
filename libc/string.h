#pragma once

#include <stddef.h>

#include "things/defs.h"

// Count the number of characters before the first NUL character ('\0')
extern _LIBC_DLLSYM size_t strlen(const char *__str);

