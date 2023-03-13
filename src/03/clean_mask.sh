#!/bin/bash
path_to_log=$(pwd)/else/log.log
error=0
count1=0
count2=0
while [[ count2 -eq 0 && count2 -eq 0 ]]
do
    echo "Удаление по маске"
    echo "Введите маску (Q q exit)"
    echo "Пример: 141222"
    read mask
    sudo find / -type f -name "*_$mask.*" > logfile.txt
    if [[ -s logfile.txt ]]; then
        for folder_log in $(cat logfile.txt)
        do
            if [[ -s "$path_to_log" && $( grep -c "$folder_log" "$path_to_log" ) -gt 0 ]]; then
                sudo rm -f $folder_log
                count1=1
            fi
        done
        if [[ $count1 -eq 1 ]]; then
        echo "File delete"
        fi
    fi
    rm -f logfile.txt
    sudo find / -type d -name "*_$mask" > logfile.txt
    if [[ -s logfile.txt ]]; then
        for folder_log in $(cat logfile.txt)
        do
            if [[ -s $path_to_log && $( grep -c "$folder_log" "$path_to_log" ) -gt 0 ]]; then
                grep "$folder_log" "$path_to_log" >> file_error.txt
                exec 0< file_error.txt
                while read folder_error
                do
                    error_path=$( echo "$folder_error" | cut -f1 -d' ' )
                if [[ "$folder_log" = "$error_path" && -d $folder_log ]]; then
                sudo rm -rf $folder_log
                count2=1 
                fi
                done
                rm -f file_error.txt
            fi
        done
        rm -f logfile.txt
        if [[ $count2 -eq 1 ]]; then
            echo "Folder delete"
        elif [[ $count1 -eq 0 ]]; then
            echo "Folder&File по данной маске не найдены!"
        fi
    fi
    if [[ $count2 -eq 0 && $count1 -eq 0 ]]; then
            if [[ $mask = q ]] || [[ $mask = Q ]]; then
            count2=1
            count1=1
            else
            echo "Folder&File по данной маске не найдены!"
            fi
    fi
done
