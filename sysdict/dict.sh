#!/bin/bash

if [ ! -f key.tmp ] ; then
    echo "Error: key.tmp no found"
    exit 1
fi

cat *.add > 1.tmp

grep -Ex "[a-z][_a-z0-9]*[a-z0-9]" key.tmp >> 1.tmp

cpp -dN /dev/null | grep -w define | awk '{print $2}' >> 1.tmp

sort -u 1.tmp > tmp.add

vim "+mkspell! sysdict tmp.add" +qall
