# Introduction

Tomodachi is a hardware add-on that extends functionality of a Raspberry Pi-compatible single-board computer. The board features a 128x64 LCD screen, two LEDs, and two push buttons. Thanks to its simplicity and versatility, the board can be put to a wide variety of practical and creative uses.

You can order an assembled and ready-to-use Tomodachi via [Gumroad](https://gum.co/tomodachi). Alternatively, you can assemble a board yourself. If you choose the DIY option, the first step is to order a PCB. While there are plenty of PCB manufacturers you can choose from, consider using [AISLER](https://aisler.net/) or [JLCPCB](https://jlcpcb.com/). AISLER manufactures PCBs in Germany, so it offers the fastest delivery. JLCPCB is based in China, and it offers the best prices and good quality.

Before you order a PCB, clone the Tomodachi Git repository using the `git clone https://github.com/dmpop/tomodachi.git` command. Alternatively, fetch the latest source code from the project's website and unpack the downloaded archive.

To order a PCB from AISLER, upload the _tomodachi.kicad\_pcb_ file in the _tomodachi/KiCad_ folder. With JLCPCB, zip the _Tomodachi-Gerber_ directory and upload the resulting archive.

To assemble the board, you need the following:

- Soldering iron
- Solder wire
- 40-pin header compatible with Raspberry Pi GPIO
- 128x64 OLED LCD display
- 2x 330Ω resistors
- 2x 5mm LEDs (preferably different colors)
- 2x 6x6x6mm micro push buttons

# Install software

To enable LEDs on the Tomodachi board, you need to configure the Raspberry Pi OS. To do this, add the following directives to the _config.txt_ file on the _boot_ partition of the storage card with Rapsberry Pi OS:

```
enable_uart=1
dtparam=act_led_gpio=11
```

Tomodachi comes with a set of shell scripts that transform it into a programmable menu-driven Raspberry Pi controller. The way it works is simple: add custom commands you want to run on the Raspberry Pi to the _commands.csv_ text file. Use the **SELECT** button to cycle through the list of the commands. Once you've selected the desired command, press the **RUN** button to execute the command on the Raspberry Pi.

To enable this functionality, make sure that the Raspberry Pi connected to the internet and run the installer script using the following command:

    curl -sSL https://raw.githubusercontent.com/dmpop/tomodachi/main/scripts/install.sh | bash

Once the installation is completed and the Raspberry Pi is rebooted, the LCD display should show the _Hey there :-)_ message.

# Basic usage

By default, the supplied _commands.csv_ in the _tomodachi/scripts_ directory list contains two commands: _Show IP_ and _Power off_. Use the **SELECT** button to select the first command, and press the **RUN** button. Assuming that the Raspberry Pi is connected to a network, you should see its IP address. To turn off the Raspberry Pi, use **SELECT** to choose the _Power off_ command and press **RUN**.

## Edit commands

You can populate the _commands.txt_ file with custom commands, using the default entries as a starting point. Each entry must follow the `Description, Command` format. The second column may contain an actual command (for example, `touch file.txt`) or point to an existing script (for example, `/home/pi/script.sh`). You can add as many command entries as you need.

To modify the _commands.txt_ file, you can either edit it directly on the Raspberry Pi, or you do it from another machine via an SSH connection. There is, however, the third option: use a special command in the _commands.txt_ file itself to fetch another version of the file from a remote location. For example, you can create a snippet on [GitLab](https://gitlab.com/) containing the desired commands, and then download it to the Raspberry Pi. This way, you'll be able to edit commands from anywhere.

To configure this feature, create a snippet on GitLab and name it _commands.csv_. Add the desired commands to the snippet, including the following one (replace _2092222_ with the actual ID of the snippet):

    Update commands, wget https://gitlab.com/-/snippets/2092222/raw/master/commands.cvs -O /home/pi/tomodachi/Scripts/

Save the snippet, and note its ID. Now open the _commands.txt_ file on the Raspberry Pi, and add the command above to it too. Save the changes, then use the Tomodachi board to select and run the **Update commands** command to fetch the remote  _commands.txt_ file.

# Update Tomodachi

To update Tomodachi, run the following commands on the Raspberry Pi:

```bash
cd /home/pi/tomodachi
git stash
git pull
git stash pop
```