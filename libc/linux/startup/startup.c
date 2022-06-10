#include "startup/startup.h"

void __libc_linux_start(int argc, char *argv[])
{
	syscall(__NR_exit_group, __libc_start(argc, argv));
}

