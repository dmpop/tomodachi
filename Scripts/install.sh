#!/usr/bin/env bash

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

# Update source and perform the full system upgrade
sudo apt update
sudo apt full-upgrade -y
sudo apt update

# Install the required packages
sudo apt install -y acl git gphoto2

# Remove obsolete packages
sudo apt autoremove -y

# Clone and configure Little Backup Box
cd
git clone https://github.com/dmpop/little-expansion-board.git
chmod +x little-expansion-board/scripts/*.sh

# Add cronjob to start the select.sh script on boot
crontab -l | {
    cat
    echo "@reboot cd /home/"$USER"/little-expansion-board/scripts/ && sudo ./select.sh"
} | crontab

# Install SSD1306 driver and its dependencies
sudo apt install -y wiringpi i2c-tools
git clone https://github.com/dmpop/ssd1306_rpi.git
cd ssd1306_rpi
cc -o oled oled.c fontx.c -lwiringPi -lpthread -DI2C
sudo cp oled /usr/local/bin/
sudo chown root:root /usr/local/bin/oled
sudo chmod 755 /usr/local/bin/oled

sudo reboot
