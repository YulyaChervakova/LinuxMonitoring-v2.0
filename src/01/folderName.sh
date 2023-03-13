#!/bin/bash

# count=0
# Счетчик количества букв в имени 
count_number_letter=0
# Какая буква идет по счету от начала регулярного выражения переданного в скрипт
number_letter=1
# Счетчик для увеличени в цикле for, если букв мало <4
count_folder=0
error=0

if [[ $folder_number -lt 5 ]]; then
if [[ ${#folder_name} < 4 ]]; then
last_for=$[$folder_number * ${#folder_name} * 4]
else
last_for=$[$folder_number * ${#folder_name}]
fi
else 
if [[ ${#folder_name} < 4 ]]; then
last_for=$[$folder_number * (${#folder_name}+3)]
else
last_for=$[$folder_number / (${#folder_name}) + 1]
fi
fi
function createnamefolder {
    local i=1
  for (( i=1; i<=$last_for; i++ )); do
    if [[ $error -eq 0 ]]; then
        a=$[ $number_letter-1 ]
        letter=${folder_name:a:1}
            for (( j=0; j<$i; j++ )); do
                arrfolder[$count_folder]=${arrfolder[$count_folder]}$letter
                count_number_letter=$[ $count_number_letter + 1 ]
            done
            m=${#folder_name}
            if [[ $number_letter = ${#folder_name} && $[ $count_number_letter ] > 3 ]]; then
                    if [[ $[ $count_folder + 1 ] -eq $folder_number ]]; then
                        error=1
                    else
                        count_folder=$[ $count_folder + 1 ]
                        arrfolder[$count_folder]=${arrfolder[$count_folder-1]}
                    fi
            else
                    if [[ $number_letter < ${#folder_name} ]]; then
                        number_letter=$[ $number_letter + 1 ]
                        createnamefolder
                        if [[ number_letter > 1 ]]; then
                        number_letter=$[ $number_letter - 1 ]
                        fi
                    fi
            fi
            for (( j=0; j<$i; j++ )); do
                if [[  $error = 0 ]]; then
                    count_number_letter=$[ $count_number_letter - 1 ]
                    arrfolder[$count_folder]=${arrfolder[$count_folder]:0:$count_number_letter}
                fi
            done
    fi
  done
}
declare -x -f createnamefolder

