#!/bin/bash
# count=0
# Счетчик количества букв в имени 
count_number_letter=0
# Какая буква идет по счету от начала регулярного выражения переданного в скрипт
number_letter=1
# Счетчик для увеличени в цикле for, если букв мало <4
# file_name.
name=$(echo $file_name | cut -f1 -d.)
count_file=0
error=0
number_all_file=100

case ${#name} in 
1 ) last_for=$[100/4 + 4];;
2 ) last_for=$[100/3 + 4];;
3 ) last_for=$[$number_all_file / 2 + 2];;
4 ) last_for=$[$number_all_file + 1];;
* ) last_for=$[$number_all_file / ${#name} + 1];;
esac

function createnamefile {
    local i=1
  for (( i=1; i<=$last_for; i++ )); do
    if [[ $error -eq 0 ]]; then
        a=$[ $number_letter-1 ]
        letter=${name:a:1}
            for (( j=0; j<$i; j++ )); do
                arrfile[$count_file]=${arrfile[$count_file]}$letter
                count_number_letter=$[ $count_number_letter + 1 ]
            done
            m=${#name}
            if [[ $number_letter = ${#name} && $[ $count_number_letter ] > 3 ]]; then
                    if [[ $[ $count_file + 1 ] -eq $number_all_file ]]; then
                        error=1
                    else
                        if [[ ${#arrfile[$count_file]} == 245 ]]; then
                        error=$count_file-1
                        else
                        count_file=$[ $count_file + 1 ]
                        arrfile[$count_file]=${arrfile[$count_file-1]}
                        fi
                    fi
            else
                    if [[ $number_letter < ${#name} ]]; then
                        number_letter=$[ $number_letter + 1 ]
                        createnamefile
                        if [[ number_letter > 1 ]]; then
                        number_letter=$[ $number_letter - 1 ]
                        fi
                    fi
            fi
            for (( j=0; j<$i; j++ )); do
                if [[  $error = 0 ]]; then
                    count_number_letter=$[ $count_number_letter - 1 ]
                    arrfile[$count_file]=${arrfile[$count_file]:0:$count_number_letter}
                fi
            done
    fi
  done
}

declare -x -f createnamefile

