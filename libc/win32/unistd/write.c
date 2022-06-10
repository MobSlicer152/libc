#include <phnt_windows.h>
#include <phnt.h>

#include "unistd.h"

_LIBC_DLLSYM uint64_t write(uint64_t __fd, void *__buf, size_t __n)
{
	IO_STATUS_BLOCK io_status;

	NtWriteFile((HANDLE)__fd, NULL, NULL, NULL, &io_status, __buf, __n, NULL, NULL);

	return io_status.Information;
}
