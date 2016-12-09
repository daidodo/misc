#!/bin/bash

INC=`echo | cpp -x c++ -Wp,-v 2>&1 | grep "#include <" -A 50 | grep "/usr" | grep -v \# | awk '{print $1}'`

processDir()
    # $1    pathname
{
    if [ -f $1 ] ; then
        echo "#include <$1>"
    elif [ -d $1 ] ; then
        for f in $1/* ; do
            processDir $f
        done
    fi
}

for d in $INC ; do
    processDir $d
done
