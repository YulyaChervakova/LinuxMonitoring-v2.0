#!/bin/bash
if [[ -f log.log ]]; then
rm -f log.log
fi
if [[ -f log_delete.txt ]]; then
rm -f log_delete.txt
fi
chmod +x *.sh
# Параметр 3 — это список букв английского алфавита, используемых в именах папок (не более 7 символов). 
export folder_name=$1
# Параметр 5 - список букв английского алфавита, используемых в имени файла и расширении (не более 7 символов для имени, не более 3 символов для расширения). 
export file_name=$2
# Параметр 6 - размер файла (в килобайтах, но не более 100).
export file_size=$3
dirName=$(dirname $0)

. ${dirName}/variableChecking.sh
. ${dirName}/action.sh

