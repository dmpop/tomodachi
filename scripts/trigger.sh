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

sudo echo 26 >/sys/class/gpio/export
sudo echo in >/sys/class/gpio/gpio26/direction
sudo echo high >/sys/class/gpio/gpio26/direction

while [ true ]; do
    if [ "$(cat /sys/class/gpio/gpio26/value)" == '0' ]; then
        command=$(head -n 1 .cmd)
        sudo oled r
        sudo oled +a "Done! :-)"
        sudo oled s
        $command
    fi
    sleep 0.1
done
