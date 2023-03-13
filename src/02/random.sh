#!/bin/bash

list=( $(ls -d /*/) )
list=( "${list[@]/"/bin/"}" )
list=( "${list[@]/"/sbin/"}" )
list=( "${list[@]/"/lost+found/"}" )
list=( "${list[@]/"/root/"}" )
list=( "${list[@]/"/boot/"}" )
list=( "${list[@]/"/proc/"}" )
list=( "${list[@]/"/run/"}" )
list=( "${list[@]/"/lib/"}" )
list=( "${list[@]/"/sys/"}" )
list=( "${list[@]/"/dev/"}" )

randvar=${#list[@]}
regex=".*/sbin/.*|.*/bin/.*|.*/sys/.*|.*/proc/.*|.*/snap/.*"
while : ; do
directory_folder=${list[$(( $RANDOM%$randvar ))]}
# Проверям есть ли наши папки в этой директории
cd $path_log
if [[ -e log.log  && $( grep -c "$directory_folders" log.log ) -eq 0 ]]; then
cd $directory_folder
if [[ $? -eq 0 && $directory_folders != "/bin/" && $directory_folders != "/sbin/" ]]; then
echo "Folder patch $directory_folder"
    break
fi
else 
cd $directory_folder
if [[ $? -eq 0 ]]; then
echo "Folder patch $directory_folder"
    break
fi
fi
done
