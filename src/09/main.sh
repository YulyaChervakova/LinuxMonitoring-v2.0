#!/bin/bash

if [ $# != 0 ] ; then
    echo "error"
    exit 1
else
    while true; do
        if [[ -f /var/www/metrics/index.html ]]; then
            sudo rm /var/www/metrics/index.html
        fi
        sudo touch /var/www/metrics/index.html
        CPU="$(cat /proc/loadavg | awk '{print $1}')"
        Disk_Space="$(df /| grep / | awk '{print $2}')"
        Disk_Space_Used="$(df /| grep / | awk '{print $3}')"
        Memory="$(free | grep Mem | awk '{print $2}')"
        Memory_Used="$(free | grep Mem | awk '{print $3}')"
        echo -e  "# help cpu take cpu" >> /var/www/metrics/index.html
        # echo -e  "# HELP cpu Take Cpu" >> /var/www/metrics/index.html
        # echo -e  "# TYPE cpu gauge" >> /var/www/metrics/index.html
        echo -e  "# type cpu gauge" >> /var/www/metrics/index.html
        echo -e  "cpu $CPU" >> /var/www/metrics/index.html
        # echo -e  "# HELP disk_space Take Disk_Space" >> /var/www/metrics/index.html
        echo -e  "# help disk_space take disk_space" >> /var/www/metrics/index.html
        # echo -e  "# TYPE disk_space gauge" >> /var/www/metrics/index.html
        echo -e  "# type disk_space gauge" >> /var/www/metrics/index.html
        echo -e  "disk_space $Disk_Space" >> /var/www/metrics/index.html
        # echo -e  "# HELP disk_space_used Take Disk_Space_Used" >> /var/www/metrics/index.html
        echo -e  "# help disk_space_used take disk_space_used" >> /var/www/metrics/index.html
        # echo -e  "# TYPE disk_space_used gauge" >> /var/www/metrics/index.html
        echo -e  "# type disk_space_used gauge" >> /var/www/metrics/index.html
        echo -e  "disk_space_used $Disk_Space_Used" >> /var/www/metrics/index.html
        # echo -e  "# HELP memory Take Memory" >> /var/www/metrics/index.html
        echo -e  "# help memory take memory" >> /var/www/metrics/index.html
        # echo -e  "# TYPE memory" >> /var/www/metrics/index.html
        echo -e  "# type memory" >> /var/www/metrics/index.html
        echo -e  "memory $Memory" >> /var/www/metrics/index.html
        # echo -e  "# HELP memory Take Memory_Used" >> /var/www/metrics/index.html
        echo -e  "# help memory take memory_used" >> /var/www/metrics/index.html
        # echo -e  "# TYPE memory_used" >> /var/www/metrics/index.html
        echo -e  "# type memory_used" >> /var/www/metrics/index.html
        echo -e  "memory_used $Memory_Used" >> /var/www/metrics/index.html
        sleep 3
    done
fi