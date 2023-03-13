#!/bin/bash
# ./main aghd jdhg.txt 5Mb
if [[ -f log.log ]]; then
rm -f log.log
fi
if [[ -f log_delete.txt ]]; then
rm -f log_delete.txt
fi
chmod +x *.sh
# Параметр 
# 1 По файлу журнала
# 2 По дате и времени создания
# 3 По маске имени (т.е. символы, подчеркивание и дата). 
export parametr_zapusk=$1

dirName=$(dirname $0)
dirLast=$(pwd)
# dirNamefile=$(dirname $0)/else
. ${dirName}/variableChecking.sh
memorycheck=$(df -BKB | grep '/$' | awk '{printf $4}' | cut -d'k' -f1)
if [[ $memorycheck -ge 1048500  ]]; then
cd ${dirName}/else/
. ./main.sh aty abkd.txt 1Mb
cd $dirLast
fi
# /home/tameikah/linux/src/03/else/log.log
. ${dirName}/action.sh