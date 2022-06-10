#include <stddef.h>

#include "startup/startup.h"

void _RTC_InitBase(void) {}
void _RTC_Shutdown(void) {}

void mainCRTStartup(void)
{
	__libc_start(0, NULL);
}
