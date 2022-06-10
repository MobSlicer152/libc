#pragma once

#include "things/defs.h"
#include "unistd.h"

// Initialization
extern _LIBC_DLLSYM void __libc_init(void);

// Calls main
extern int __libc_start(int argc, char *argv[]);

// Program entry point
extern int main(int argc, char *argv[]);

