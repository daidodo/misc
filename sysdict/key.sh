#!/bin/bash

CXXFLAGS="--std=c++14 -pthread"

./file.sh | sort -u > file.tmp

echo "Found `wc -l file.tmp | awk '{print $1}'` system headers"

DIR="tmp"
DIR2="tmp2"

rm -rf $DIR && mkdir -p $DIR

sz=`wc -l file.tmp | awk '{print $1}'`
each=1

for (( i = 0 ; sz > 0 ; ++i )) ; do
    tail -n $each file.tmp > $DIR/$i.cc
    (( sz -= each ))
    head -n $sz file.tmp > 1.tmp
    mv 1.tmp file.tmp
done

echo "Split to $i source files, step = $each"

rm -rf $DIR2 && mkdir -p $DIR2

for f in $DIR/*.cc ; do
    g++ -E $CXXFLAGS $f > $DIR2/`basename $f` 2>/dev/null
done

echo "Preprocess source files done"

ctags --c-kinds=+px-d -f tags.tmp $DIR2/*

echo "Generate `wc -l tags.tmp | awk '{print $1}'` tags"

awk -F'\t' '{print $1}' tags.tmp | grep -v ! | grep -v \~ | sort -u > key.tmp

echo "Generate with `wc -l key.tmp | awk '{print $1}'` keywords"


echo "Finish."
