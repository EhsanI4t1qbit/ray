#!/bin/bash

TMPFILE=`mktemp`
DIRECTORY=`dirname $0`
SCRIPT=$1
shift

if [ -x $DIRECTORY/../$SCRIPT ]; then
    time $DIRECTORY/../$SCRIPT "$@" >$TMPFILE 2>&1
else
    time python $DIRECTORY/../$SCRIPT "$@" >$TMPFILE 2>&1
fi

CODE=$?
if [ $CODE != 0 ]; then
    cat $TMPFILE
    echo "FAILED $CODE"
    exit $CODE
fi

exit 0
