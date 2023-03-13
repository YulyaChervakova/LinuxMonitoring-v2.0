#!/bin/bash
export arrfolder
export arrfile
export error=0
# Содать имена папкам
source folderName.sh
createnamefolder
if [[ $error!=0 && $error != 1 ]]; then 
folder_number=$error
fi
# Содать имена файлам
max=100
source fileName.sh
createnamefile
if [[ $error!=0 && $error != 1 ]]; then 
max=$error
fi
error=0
export path_log=$(pwd)
date=$(date +"%d%m%y")
date_file=$(date +"%d %b %Y %H:%M:%S")
# file_size
size=$(echo "$file_size" | cut -f1 -d'M')
# Формат
extensions=$(echo $file_name | cut -f2 -d.)
memorycheck=$(df -BKB | grep '/$' | awk '{printf $4}' | cut -d'k' -f1)

while [[ $error -ne 1 ]]
do
    . ./random.sh
    for (( i=0; i<$folder_number; i++ )); do
    if [[ $error -ne 1 ]]; then
        sudo mkdir "${arrfolder[$i]}"_"$date" 2> /dev/null 
        cd "${arrfolder[$i]}"_"$date"
        echo "$(pwd) "---" $date_file " >> $path_log"/"log.log
        file_number=$(( $RANDOM % $max+1 ))
        for (( j=0; j<$file_number; j++ )); do
        m=$(pwd)/${arrfile[$j]}_$date.$extensions
           if [[ ${#m} -ne 4095 ]]; then
                sudo fallocate -l $size"Mb" "${arrfile[$j]}"_"$date"."$extensions" 2> /dev/null 
                echo "$(pwd)"/"${arrfile[$j]}"_"$date"."$extensions "---" $date_file "---" "$file_size"" >> $path_log"/"log.log
                memorycheck=$(df -BKB | grep '/$' | awk '{printf $4}' | cut -d'k' -f1)
                if [[ $memorycheck -le 1048500  ]]; then
                error=1
                break
                fi
            else
            error=1
            break
            fi
        done
        memorycheck=$(df -BKB | grep '/$' | awk '{printf $4}' | cut -d'k' -f1)
        if [[ $memorycheck -le 1048500  ]]; then
        echo "Доступное место для засорения закончилось"
        error=1
        break
        fi
        fi
    done
done

df -h / | grep '/$' | awk '{printf $4}' | cut -d'k' -f1
# Зачистка памяти файлы/папки
cd $path_log
touch logfile.txt
sudo find / -type f -name "*_$date.$extensions" > logfile.txt
for folder_log in $(cat logfile.txt)
do
if [[ $( grep -c "$folder_log" log.log ) -gt 0 ]]; then
sudo rm -f $folder_log
fi
done
rm -f logfile.txt
# Зачистка памяти файлы/папки
touch logfile.txt
sudo find / -type d -name "*_$date" > logfile.txt
for folder_log in $(cat logfile.txt)
do
if [[ $( grep -c "$folder_log" log.log ) -gt 0 ]]; then
sudo rm -rf $folder_log
fi
done
rm -f logfile.txt
df -h / | grep '/$' | awk '{printf $4}' | cut -d'k' -f1