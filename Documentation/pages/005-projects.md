# Tomodachi projects

Since Tomodachi makes it possible to run commands and scripts on the Raspberry Pi, what you can use the board for is only limited by your imagination and programming skills. Here are a few project ideas you can use as stating points.

## Internet radio streaming

1. Install MPlayer on the Raspberry Pi using the `sudo apt install mplayer` command.
2. Create the _playlists_ folder in the _/home/pi_ directory.
3. Use the [Community Radio Browser](https://www.radio-browser.info/) to find radio stations you like and download their PLS files to the _/home/pi/playlists_ directory.
4. Open the _tomodachi/scripts/commands.csv_ for editing and add the following commands (replace examples with actual names of radio stations and correct paths to their respective playlist files):
```
Stop radio, eval sudo killall mplayer &>/dev/null & disown;
Station 1, eval mplayer -playlist /home/pi/playlists/station1.pls &>/dev/null & disown;
Station 2, eval mplayer -playlist /home/pi/playlists/station2.pls &>/dev/null & disown;
```
5. Save the changes and reboot the Raspberry Pi.
6. Use the **SELECT** button to select the desired station and press **RUN** to stream it.

Note that if you want to switch to a different station, you need to run the **Stop radio** command first.

## Camera remote control

If your camera is supported by [gPhoto2](http://gphoto.org/), you can turn the Raspberry Pi into a tethered camera controller.

1. Install gPhoto2 on the Raspberry Pi using the `sudo apt install gphoto2` command.
2. Open the _tomodachi/scripts/commands.csv_ for editing and add the following commands:
```
Capture, gphoto2 --capture-image
Get all files, --get-all-files --skip-existing --filename %Y%m%d-%H%M%S-%03n.%C
```

The first command takes a photo, while the second one transfers all files from the camera to the Raspberry Pi.

3. Save the changes and reboot the Raspberry Pi.
4. Connect your camera to the Raspberry Pi. Switch the camera on, and enable the remote control mode, if necessary.
5. Use the **SELECT** button to select the desired command and press **RUN** to stream it.

## Fetch weather conditions

In addition to specifying direct commands, it's also possible to call external shell scripts from the _commands.csv_ file. This allows you to define complex multi-command actions. For example, you can create a script that displays weather conditions in a specific city and call the script from the command file.

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

2. Save the file in the home directory (that is, _/home/pi_) and make the script executable using the `chmod +x weather.sh` command.
3. Open the _tomodachi/scripts/commands.csv_ file for editing and add the following command to it:

    Weather, sudo /home/pi/weather.sh

4. Save the changes and reboot the Raspberry Pi.
5. Use the **SELECT** button to select the **Weather** command and press **RUN** to run it.