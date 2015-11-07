#!/bin/bash

# shell script to control the fan speed

# ++ = stop 0rpm
# +- = low 1500rpm
# -+ = med 3250rpm
# -- = high 5000rpm

case $1 in
    off)
        echo 1 > /sys/class/gpio/gpio16/value
        echo 1 > /sys/class/gpio/gpio17/value
    ;;
    low)
        echo 1 > /sys/class/gpio/gpio16/value
        echo 0 > /sys/class/gpio/gpio17/value
    ;;
    mid)
        echo 0 > /sys/class/gpio/gpio16/value
        echo 1 > /sys/class/gpio/gpio17/value
    ;;
    high)
        echo 0 > /sys/class/gpio/gpio16/value
        echo 0 > /sys/class/gpio/gpio17/value
    ;;
    state)
        F1="$(cat /sys/class/gpio/gpio16/value)"
        F2="$(cat /sys/class/gpio/gpio17/value)"
        if [ "$F1" == "$F2" ]; then
            if [ "$F1" == "1" ]; then
                echo "off"
            else
                echo "high"
            fi
        elif [ "$F1" > "$F2" ]; then
            echo "mid"
        elif [ "$F1" < "$F2" ]; then
            echo "low"
        else
            echo "state of the fan undetermined"
        fi
    ;;
    *)
        echo "arguments: off, low, mid, high, or state"
    ;;
esac