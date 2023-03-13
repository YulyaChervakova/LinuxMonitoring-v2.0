#!/bin/bash
export arrfolder
export arrfile
# Содать имена папкам
source folderName.sh
createnamefolder
# Содать имена файлам
source fileName.sh
createnamefile

path_log=$(pwd)
date=$(date +"%d%m%y")
date_file=$(date +"%d %b %Y %H:%M:%S")
# file_size
size=$(echo "$file_size" | cut -f1 -d'k')
# Формат
extensions=$(echo $file_name | cut -f2 -d.)
cd $dirnamePath
for (( i=0; i<$folder_number; i++ )); do
sudo mkdir "${arrfolder[$i]}"_"$date"
cd "${arrfolder[$i]}"_"$date"
echo "$(pwd) "---" $date_file " >> $path_log"/"log.log
    for (( j=0; j<$file_number; j++ )); do
        sudo fallocate -l $size"KB" "${arrfile[$j+$i*3]}"_"$date"."$extensions"
        echo "$(pwd)"/"${arrfile[$j+$i*3]}"_"$date"."$extensions "---" $date_file "---" "$file_size"" >> $path_log"/"log.log
        memorycheck=$(df -BKB | grep '/$' | awk '{printf $4}' | cut -d'k' -f1)
        if [[ $memorycheck -lt 1000000 ]]; then
        echo "Осталось 1GB памяти"
        exit 1
        fi
    done
done


