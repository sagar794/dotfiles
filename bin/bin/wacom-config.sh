#!/bin/sh

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

list=$(xsetwacom list devices)
pad=$(echo "${list}" | awk '/pad/{print $8}')
stylus=$(echo "${list}" | xsetwacom list devices | awk '/stylus/{print $8}')

if [ -z "${pad}" ]; then
    exit 0
fi

xsetwacom set "${stylus}" Button 2 pan
xsetwacom set "${stylus}" PanScrollThreshold 150

