#!/bin/bash

#echo | cpp -x c++ -Wp,-v 2>&1 | grep "#include <" -A 50 | grep "/usr" | awk '{print $1}' > inc.list

INC=`echo | cpp -x c++ -Wp,-v 2>&1 | grep "#include <" -A 50 | grep "/usr" | awk '{print $1}'`

ctags -f ~/sys.tags -R $INC

for d in $INC ; do
  echo -n ",$d"
done

echo
