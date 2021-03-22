# Tomodachi projects

Since Tomodachi makes it possible to run commands and scripts on the Raspberry Pi, what you can use the board for is only limited by your imagination and programming skills. Here are a few project ideas you can use as stating points.

## Internet radio streaming

1. Install the MPlayer on the Raspberry Pi using the `sudo apt install mplayer` command.
2. Create the _playlists_ folder in the _/home/pi_ directory.
3. Use the [Community Radio Browser](https://www.radio-browser.info/) to find radio stations you like and download their PLS files to the _/home/pi/playlists_ directory.
4. Open the _tomodachi/Scripts/commands.csv_ for editing and add the following commands (replace examples with actual names of radio stations and correct paths to their respective playlist files):
```
Stop radio, eval sudo killall mplayer &>/dev/null & disown;
Station 1, eval mplayer -playlist /home/pi/playlists/station1.pls &>/dev/null & disown;
Station 2, eval mplayer -playlist /home/pi/playlists/station2.pls &>/dev/null & disown;
```
5. Save the changes and reboot the Raspberry Pi.
6. Use the **SELECT** button to select the desired station and press **RUN** to stream it.

Note that if you want to switch to a different station, you need to run the **Stop radio** command first.