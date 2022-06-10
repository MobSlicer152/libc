#pragma once

#include <stddef.h>

#include "things/defs.h"

// Allocate __n bytes of memory
extern _LIBC_DLLSYM void *malloc(size_t __n);

// Allocate __n * __size zeroed bytes
extern _LIBC_DLLSYM void *calloc(size_t __n, size_t __size);

// Free a chunk of memory allocated by the standard library (malloc, calloc, etc)
extern _LIBC_DLLSYM void free(void *__chunk);

