#!/bin/bash
. ./function.sh
case ${1} in 
1 ) . ./clean_log.sh;;
2 ) . ./clean_time.sh;;
3 ) . ./clean_mask.sh;;
4 ) . ./clean_mask.sh;;
esac