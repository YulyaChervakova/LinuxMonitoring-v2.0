#!/bin/bash
error=0
while : ; do
    echo "Удаление по log - файлу"
    echo "Введите путь"
    echo "Пример: /home/tameikah/linux/src/02/log.log)"
    echo "Для выхода нажмите q"
    path_log=''
    read path_log
    # path_log=/home/tameikah/linux/src/03/else/log.log
    log=$(echo "$path_log" | grep -c 'log.log')
        if [[ -f $path_log && $log -eq 1 ]]; then
            exec 0< $path_log
            count=1
            while read line
            do
            rezult=$(echo "$line" | cut -d' ' -f1)
            if [[ -f $rezult ]]; then
            sudo rm -f $rezult
            elif [[ -d $rezult ]]; then
            sudo rm -rf $rezult
            fi
            done
        break
        elif [[ $path_log = q ]] || [[ $path_log = Q ]]; then
        break
        else
        echo "Неверный путь"
        fi
done