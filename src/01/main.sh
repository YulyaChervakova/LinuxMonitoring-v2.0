#!/bin/bash
if [[ -f log.log ]]; then
rm -f log.log
fi
chmod +x *.sh
# Параметр 1 — это абсолютный путь. 
export dirnamePath=$1
# Параметр 2 — количество подпапок. 
export folder_number=$2
# Параметр 3 — это список букв английского алфавита, используемых в именах папок (не более 7 символов). 
export folder_name=$3
# Параметр 4 — количество файлов в каждой созданной папке. 
export file_number=$4
# Параметр 5 - список букв английского алфавита, используемых в имени файла и расширении (не более 7 символов для имени, не более 3 символов для расширения). 
export file_name=$5
# Параметр 6 - размер файла (в килобайтах, но не более 100).
export file_size=$6
dirName=$(dirname $0)
. ${dirName}/variableChecking.sh
. ${dirName}/action.sh

