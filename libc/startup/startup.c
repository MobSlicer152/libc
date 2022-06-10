#include "startup.h"

int __libc_start(int argc, char *argv[])
{
	int ret;

	__libc_init();

	ret = main(argc, argv);

	return ret;
}

