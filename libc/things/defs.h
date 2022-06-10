#pragma once

#ifdef _LIBC_BUILD
#ifdef _MSC_VER
#define _LIBC_DLLSYM __declspec(dllexport)
#else
#define _LIBC_DLLSYM __attribute__((visibility("default")))
#endif
#else
#ifdef _MSC_VER
#define _LIBC_DLLSYM __declspec(dllimport)
#else
#define _LIBC_DLLSYM
#endif
#endif // _LIBC_BUILD

