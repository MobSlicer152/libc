#!/usr/bin/env sh

here=$(dirname $0)
for x in $here/*.sh; do
	echo Making $x executable
	chmod a+x $x
done
