#!/bin/bash

INC=`echo | cpp -x c++ -Wp,-v 2>&1 | grep "#include <" -A 50 | grep "/usr" | grep -v \# | awk '{print $1}'`

LIST=

for f in $INC ; do
    LIST+=" $f"
done

./gendict $LIST
