# Tomodachi projects

Since Tomodachi makes it possible to run commands and scripts on the Raspberry Pi, what you can use the board for is only limited by your imagination and programming skills. Here are a few project ideas you can use as stating points.

## Internet radio



```bash
sudo apt install mplayer
````

```
Stop radio, eval sudo killall mplayer &>/dev/null & disown;
Station 1, eval mplayer -playlist /home/pi/playlists/station1.pls &>/dev/null & disown;
Station 2, eval mplayer -playlist /home/pi/playlists/station2.pls &>/dev/null & disown;
```