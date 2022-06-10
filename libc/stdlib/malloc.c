#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "things/defs.h"

// Magic number for validating allocated chunks
#define _LIBC_ALLOC_MAGIC 'cigam_colla' // Backwards because of endianness

// Check if a chunk entry is valid
#define _LIBC_ALLOC_IS_VALID(chunk) (chunk && chunk->magic == _LIBC_ALLOC_MAGIC)

// Get the size of a valid chunk without the metadata
#define _LIBC_ALLOC_SIZE(chunk) (chunk->size - sizeof(*chunk))

// Chunk list entry
struct __chunk {
	uint64_t magic; // Must equal _LIBC_ALLOC_MAGIC
	size_t size; // Original size including metadata
	bool free; // Whether the chunk is free
	struct __chunk *prev; // Previous chunk entry
	struct __chunk *next; // Next chunk entry
};

// Start of the chunk list
static struct __chunk *__chunk_list_head = NULL;

// Allocate a new chunk using __alloc. __n can be 0.
//static struct __chunk *__get_new_chunk(size_t __n);

// Defragment chunks
//static void __defrag_chunk_list(void);

// Find or allocate a suitable chunk
static struct __chunk *__find_free_chunk(size_t __size);

_LIBC_DLLSYM void *malloc(size_t __n)
{
	struct __chunk *chunk;

	if (!__n)
		return NULL;

	chunk = __find_free_chunk(__n);
	return chunk ? ++chunk : NULL;
}

static struct __chunk *__find_free_chunk(size_t __size)
{
	(void)__size;
	return __chunk_list_head;
}

