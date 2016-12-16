#!/bin/bash

each=1
CXXFLAGS="--std=c++14 -pthread"

rm -rf *tmp*

INC=`echo | cpp -x c++ -Wp,-v 2>&1 | grep "#include <" -A 50 | grep "/usr" | grep -v \# | awk '{print $1}'`

processDir()
    # $1    pathname
{
    if [ -f $1 ] ; then
        echo "#include <$1>"  >> file.tmp
    elif [ -d $1 ] ; then
        for f in $1/* ; do
            processDir $f
        done
    fi
}

for d in $INC ; do
    processDir $d
done

sort -u file.tmp > 1.tmp && mv 1.tmp file.tmp

echo "Found `wc -l file.tmp | awk '{print $1}'` system headers"

DIR="tmp"
DIR2="tmp2"

mkdir -p $DIR

sz=`wc -l file.tmp | awk '{print $1}'`

for (( i = 0 ; sz > 0 ; ++i )) ; do
    tail -n $each file.tmp > $DIR/$i.cc
    (( sz -= each ))
    head -n $sz file.tmp > 1.tmp
    mv 1.tmp file.tmp
done

echo "Split to $i source files, step = $each"

mkdir -p $DIR2

for f in $DIR/*.cc ; do
    g++ -E $CXXFLAGS $f > $DIR2/`basename $f` 2>/dev/null
done

echo "Preprocess source files done"

ctags --c-kinds=+px-d -f tags.tmp $DIR2/*

echo "Generate `wc -l tags.tmp | awk '{print $1}'` tags"

awk -F'\t' '{print $1}' tags.tmp | grep -v ! | grep -v \~ | sort -u > system_keys.save

echo "Generate with `wc -l key.tmp | awk '{print $1}'` keywords"

./dict.sh

echo "Finish."
