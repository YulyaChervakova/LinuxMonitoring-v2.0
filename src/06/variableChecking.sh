#!/bin/bash
if [ "$#" != 1 ]; then
    echo "Неверное количество аргументов."
    exit 1
fi
# Поиск
valid='1-4'
if [[ $parametr_zapusk =~ [^$valid] ]]; then
    echo "Команда содержит символы введите 1-4 для поиска."
    exit 1
fi

if [[ $parametr_zapusk < 1 ]] || [[ $parametr_zapusk > 4 ]]; then
    echo "Команда содержит число больше или меньше диапозона введите 1-4 для поиска."
    exit 1
fi