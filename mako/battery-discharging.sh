#!/usr/bin/env sh

######################################################################
# @author      : kimono (kimono@playground)
# @file        : battery-discharging
# @created     : Friday Mar 29, 2024 21:10:34 MST
#
# @description : send notification for battery
######################################################################

acpi -b | awk -F ":|,|%" '{print $2, $3}'| {
    read -r status capacity
    
    if [ "$status" = Discharging -a "$capacity" -lt 25 ]; then
        notify-send --urgency=critical -a "Battery Low" "Plug In Charger"
    fi 

    if [ "$status" = Discharging -a "$capacity" -lt 10 ]; then
        notify-send --urgency=critical -a "Battery Critically Low" "Plug In Charger"
    fi 
}

