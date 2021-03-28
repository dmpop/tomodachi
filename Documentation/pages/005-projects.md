# Tomodachi projects

Since Tomodachi makes it possible to run practically any command and script on the Raspberry Pi, what you can use the board for is limited only by your imagination and programming skills. Here are a few ideas you can use as starting points.

## Internet radio streaming

1. Install MPlayer on the Raspberry Pi using the `sudo apt install mplayer` command.
2. Create the _playlists_ folder in the _/home/pi_ directory.
3. Use the [Community Radio Browser](https://www.radio-browser.info/) to find radio stations you like, and download their PLS files to the _/home/pi/playlists_ directory.
4. Open the _tomodachi/scripts/commands.csv_ file for editing and add the following commands (replace examples with the actual names of radio stations and correct paths to their respective playlist files):

```
Stop radio, eval sudo killall mplayer &>/dev/null & disown;
Station 1, eval mplayer -playlist /home/pi/playlists/station1.pls &>/dev/null & disown;
Station 2, eval mplayer -playlist /home/pi/playlists/station2.pls &>/dev/null & disown;
```

5. Save the changes and reboot the Raspberry Pi.
6. Use the **SELECT** button to choose the desired station and press **RUN** to stream it.

Note that if you want to switch to a different station, you need to run the **Stop radio** command first.

## Camera remote control

If your camera is supported by [gPhoto2](http://gphoto.org/), you can turn the Raspberry Pi and Tomodachi combo into a tethered camera controller.

1. Install gPhoto2 on the Raspberry Pi using the `sudo apt install gphoto2` command.
2. Open the _tomodachi/scripts/commands.csv_ file for editing and add the following commands:

```
Capture, gphoto2 --capture-image-and-download --filename %Y%m%d-%H%M%S-%03n.%C
Get all files, --get-all-files --skip-existing --filename %Y%m%d-%H%M%S-%03n.%C
```

The first command takes a photo, while the second one transfers all files from the camera to the Raspberry Pi.

3. Save the changes and reboot the Raspberry Pi.
4. Connect your camera to the Raspberry Pi. Switch the camera on and enable the remote control mode, if necessary.
5. Use the **SELECT** button to choose the desired command and press **RUN** to stream it.

## Fetch weather conditions

In addition to specifying direct commands, it's also possible to call external shell scripts from the _commands.csv_ file. This allows you to define complex multi-command actions. For example, you can create a script that displays the weather conditions in a specific city and call the script from the command file.

1. On the Raspberry Pi, run the `nano weather.sh` command and paste the following code into the blank text file (replace _Tokyo_ with the desired city):

```bash
#!/usr/bin/env bash
city="Tokyo"
t=$(curl wttr.in/$city?format="%t")
w=$(curl wttr.in/$city?format="%w")
p=$(curl wttr.in/$city?format="%p")
sudo oled r
sudo oled +a "= $city ="
sudo oled +b "Temp: $t"
sudo oled +c "Wind: $w"
sudo oled +d "Precip: $p"
sudo oled s
```

The script uses the _curl_ tool to fetch weather conditions via the [wttr.in](https://wttr.in/) service, parses the obtained data, and displays it on the screen.

2. Save the file in the _/home/pi_ directory and make the script executable using the `chmod +x weather.sh` command.
3. Open the _tomodachi/scripts/commands.csv_ file for editing and add the following command to it:

    Weather, sudo /home/pi/weather.sh

4. Save the changes and reboot the Raspberry Pi.
5. Use the **SELECT** button to choose the **Weather** command and press **RUN** to run it.

## Show storage usage

You can use Tomodachi to display storage usage stats.

1. On the Raspberry Pi, run the `nano usage.sh` command and paste the following code into the blank text file:

```bash
#!/usr/bin/env bash
limit="75"
part="root"
used=$(df -h | grep $part | awk '{ print $3 }')
used_int=$(df -h | grep $part | awk '{ print $5 }' | cut -d'%' -f1)
avail=$(df -h | grep $part | awk '{ print $4 }')
echo $avail
percent=$(df -h | grep $part | awk '{ print $5 }')
sudo oled r
sudo oled +a "= $part ="
sudo oled +b "Used: $used"
sudo oled +c "Avail: $avail"
sudo oled +d "Percent: $percent"
sudo oled s
if [ $used_int -gt $limit ]; then
  sudo sh -c "echo timer > /sys/class/leds/led0/trigger"
  sudo sh -c "echo 1000 > /sys/class/leds/led0/delay_on"
fi
```

The `limit` variable determines when to trigger the ACT LED, which indicates that the storage capacity is nearing its limit. By default, it's set to 75% of used storage space, but you can adjust it, if necessary. You can also specify a different storage partition by modifying the value of the `part` variable.

2. Save the file in the _/home/pi_ directory and make the script executable using the `chmod +x usage.sh` command.
3. Open the _tomodachi/scripts/commands.csv_ file for editing and add the following command to it:

    Storage usage, sudo /home/pi/usage.sh

4. Save the changes and reboot the Raspberry Pi.
5. Use the **SELECT** button to choose the **Storage usage** command and press **RUN** to run it.

## Show stats

You can use Tomodachi to display hardware stats.

1. On the Raspberry Pi, run the `nano stats.sh` command and paste the following code into the blank text file:

```bash
#!/usr/bin/env bash
temp=$(expr $(cat /sys/class/thermal/thermal_zone*/temp) / 1000)
mem=$(printf "%0.2f\n" $(free | grep Mem | awk '{print $3/$2 * 100.0}'))
cpu=$(vmstat | tail -1 | awk '{print $15}')
sudo oled r
sudo oled +a "==== STATS ===="
sudo oled +b "- Tem: "$temp"C"
sudo oled +c "- Mem: "$mem"%"
sudo oled +d "- CPU: "$cpu"%"
sudo oled s
```

2. Save the file in the _/home/pi_ directory and make the script executable using the `chmod +x stats.sh` command.
3. Open the _tomodachi/scripts/commands.csv_ file for editing and add the following command to it:

    Storage usage, sudo /home/pi/stats.sh

4. Save the changes and reboot the Raspberry Pi.
5. Use the **SELECT** button to choose the **Stats** command and press **RUN** to run it.