#!/bin/bash
error=0
path_to_log=$(pwd)/else/log.log
echo $path_to_log
while [[ $error -eq 0 ]]
do
regu='[1-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9] [0-2][0-9]:[0-6][0-9]'
    echo "Удаление по дате и времени создания"
    while : ; do
        echo "Введите дату и время начала (Пример: '2022-12-13 20:25')"
        echo "Для выхода нажмите q"
        read date_start
        if [[ $date_start = q || $date_start = Q ]]; then
            error=1
            break
        elif ! [[ $date_start =~ $regu ]]; then
            echo "Ошибка при вводе даты1, повторите попытку"
            printf "\n"
        else
            break
        fi
    done
    if [[ error -eq 0 ]]; then
    while : ; do
        echo "Введите дату и время конца (Пример: '2022-12-13 20:25')"
        echo "Для выхода нажмите q"
        read date_end
        if [[ $date_end = q || $date_end = Q ]]; then
            error=1
            break
        elif ! [[ $date_end =~ $regu ]]; then
            echo "Ошибка при вводе даты2, повторите попытку"
            printf "\n"
        else
            break
        fi
    done
    fi

    if [[ error -eq 0 ]]; then
    if [[ $date_start < $date_end || $date_start == $date_end ]]; then
    error=1
# Зачистка памяти файлы
# Поиск файлов по Дате создания
sudo find / -type f -newerct "$date_start:00" ! -newerct "$date_end:59" 2>/dev/null > logfile.txt
    if [[ -s logfile.txt ]]; then
    for folder_log in $(cat logfile.txt)
    do
        if [[ -s "$path_to_log" && $( grep -c "$folder_log" "$path_to_log" ) -gt 0 ]]; then
            sudo rm -f $folder_log
        fi
    done
    fi
    rm -f logfile.txt
# Зачистка памяти папки
sudo find / -type d -newerct "$date_start:00" ! -newerct "$date_end:59" > logfile.txt
    if [[ -s logfile.txt ]]; then
    for folder_log in $(cat logfile.txt)
    do
        if [[ -s $path_to_log && $( grep -c "$folder_log" "$path_to_log" ) -gt 0 ]]; then
            grep "$folder_log" "$path_to_log" >> file_error.txt
            exec 0< file_error.txt
            while read folder_error
            do
              error_path=$( echo "$folder_error" | cut -f1 -d' ' )
            # 2022-12-14 19:51
                if [[ "$folder_log" = "$error_path" && -d $folder_log ]]; then
                sudo rm -rf $folder_log 
                fi
            done
            # cat file_error.txt
            rm -f file_error.txt
        fi
    done
    fi
    rm -f logfile.txt
    else 
    echo "Дата начала поиска больше $date_start > $date_end"
    fi
    fi
done