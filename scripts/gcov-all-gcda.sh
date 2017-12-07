#!/bin/sh

# Author: Hugues Evrard
# License: MIT

# call gcov for all gcda files found under working directory

for i in `find . -name '*.gcda'`
do
    d=`dirname $i`
    o="`basename $i .gcda`.o"

    # You may want to disable the following
    if test ! -f $d/$o
    then
        echo "ERROR: file not found: $d/$o"
        exit 1
    fi

    (
        cd $d
        gcov $o
    )
done
