/*
 * Copyright (c) 2022, Avalon Williams
 * See file LICENSE for details
 */

#ifndef COMPAT_H
#define COMPAT_H

#include <bsd/string.h>
#include <errno.h>

#ifndef EFTYPE
#define EFTYPE EINVAL
#endif

#endif
