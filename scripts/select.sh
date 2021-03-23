#!/bin/bash

# Author: Dmitri Popov, dmpop@linux.com

#######################################################################
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#######################################################################

i=1
commands="commands.csv"
n=$(wc -l <"$commands")

[ -e .cmd ] && rm .cmd

sudo oled r
sudo oled +a "Hello there! :-)"
sudo oled s

sudo echo 5 >/sys/class/gpio/export
sudo echo in >/sys/class/gpio/gpio5/direction
sudo echo high >/sys/class/gpio/gpio5/direction

source "trigger.sh" &
PID=$!

while [ true ]; do
    if [ "$(cat /sys/class/gpio/gpio5/value)" == '0' ]; then
        name=$(sed -n "${i}p" "$commands" | awk -F "\"*,\"*" '{print $1}')
        command=$(sed -n "${i}p" "$commands" | awk -F "\"*,\"*" '{print $2}')
        echo "$command" >.cmd
        sudo oled r
        sudo oled +a "$name"
        sudo oled s
        i=$((i + 1))
        if [ $i -gt $n ]; then
            i=1
        fi
    fi
    sleep 0.1
done
