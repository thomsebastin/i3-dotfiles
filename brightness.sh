#!/bin/bash

# It's necessary give the correct permissions for the brightness file
# Verify the correct path to the brightness file on your pc

# Parameters: "inc" for increment and "dec" for decrement brightness

#get the current brightness
current=`cat /sys/class/backlight/intel_backlight/actual_brightness`

# sum or subtract 10 from current brightness
if [ "$1" == "inc" ]; then
    current=$(expr $current + "$2")
elif [ "$1" == "dec" ]; then
    current=$(expr $current - "$2")
fi

#save the current brightness
`echo $current > /sys/class/backlight/intel_backlight/brightness`
