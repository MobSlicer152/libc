#!/usr/bin/env sh

uname -m | sed -E 's/((i(3|5|6))|(x86_|amd))/x/g'
