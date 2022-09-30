#!/bin/bash

current_date_time="`date "+%Y-%m-%d_%H-%M-%S"`";
import /home/ashwini/Pictures/scrshot-$current_date_time.png
noti=$(echo -e "Scrennshot Captured \nSaved in /home/ashwinisahu/Pictures/scrshot-$current_date_time.png")

if [ "$?" == 0 ]
    then
        notify-send -t 2000 "$noti"
fi
