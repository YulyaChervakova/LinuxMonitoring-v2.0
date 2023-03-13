#!/bin/bash
if [ "$#" != 6 ]; then
    echo "Неверное количество аргументов."
    exit 1
fi
# 1. dirnamePath 
if [[ ! -d "$dirnamePath" ]]; then
    echo "$dirnamePath Директория не существует."
    exit 1
fi
# 2. 4. folder_number file_number
valid1='0-9'
if [[ $folder_number =~ [^$valid1] ]] || [[ $file_number =~ [^$valid1] ]]; then
    echo "Неверное число папок или файлов."
    exit 1
fi
valid1='0-9'
if [[ $folder_number -le 0 ]] || [[ $file_number -le 0 ]]; then
    echo "Неверное число папок или файлов."
    exit 1
fi
# 3. folder_name
valid='a-zA-Z'
if [[ $folder_name =~ [^$valid] ]]; then
    echo "Имя папки содержит символы используй [A-z]."
    exit 1
fi
if [[ ${#folder_name} > 7 ]] || [[ ${#folder_name} < 1 ]]; then
    echo "Много символов для имени папки."
    exit 1
fi
# 5.file_name
name=$(echo $file_name | cut -f1 -d.)
extensions=$(echo $file_name | cut -f2 -d.)
if [[ $name =~ [^$valid] ]] || [[ $extensions =~ [^$valid] ]] || [[ $extensions = $file_name ]]; then
    echo "Имя для файла или раширение файла содержит символы используй [A-z]."
    exit 1
fi
if [[ ${#name} > 7 ]] || [[ ${#name} < 1 ]]; then
    echo "Ошибка в кол-ве символов для имени файла."
    exit 1
fi
if [[ ${#extensions} > 4 ]] || [[ ${#extensions} < 1 ]]; then
    echo "Ошибка в кол-ве символов для расширения файла."
    exit 1
fi
# 6. file_size
size=$(echo "$file_size" | cut -f1 -d'k')
if [[ $size = $file_size ]] || [[ $size =~ [^$valid1] ]] || [[ $size -gt 100 ]] || [[ $size -lt 1 ]]; then
    echo "Неверный размер файла $size."
    exit 1
fi

extensions_kb=$(echo "$file_size" | cut -f2 -d'k')
extensions_kb=k$extensions_kb
if [[ $extensions_kb != 'kb' ]]; then
echo "Размер файла должен быть указан в килобайтах(kb)."
exit 1
fi
