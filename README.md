# OpenCompress

Linux port of OpenBSD's compress(1). OpenBSD's compress is a zlib frontend and
provides the standard UNIX command compress and uncompress(1), as well as,
optionally, gzip(1), zcat(1), and their related utilities.

This is useful for those who want a compress command on their Linux systems, as
well as for those who wish to replace the GNU implementation of gzip with a
simpler one.

GNU gzip, in true GNU fashion, is fairly complex for what should be a simple
program, for example, it has support for a number of outdated operating systems
hardly anyone uses, like AmigaOS, Atari ST, OS/2 Warp, and VMS. This can act
as a drop-in replacement for GNU gzip.

## Install
This program depends on libbsd and zlib.
To install just compress and uncompress, simply use
```sh
make && sudo make install
```

To install compress and uncompress as well as gzip, zcat, etc., use
```sh
make && sudo make ADDITIONAL=y install
```

If you use [doas(1)](https://github.com/Duncaen/OpenDoas) instead of sudo(1),
simply replace sudo with doas accordingly.

## Copyright

Copyright (c) 2022, Avalon Williams
All rights reserved.

See the LICENSE file for details
