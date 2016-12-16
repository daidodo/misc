#!/bin/bash

if [ ! -f system_keys.save ] ; then
    echo "Error: system_keys.save no found"
    exit 1
fi

rm -f tmp.add

cat *.add > 1.tmp

grep -Ex "[a-z][_a-z0-9]*[a-z0-9]" system_keys.save >> 1.tmp

cpp -dN /dev/null | grep -w define | awk '{print $2}' >> 1.tmp

sort -u 1.tmp > tmp.add

vim "+mkspell! -ascii sysdict tmp.add" +qall
