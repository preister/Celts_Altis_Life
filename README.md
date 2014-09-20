Celts Altis Life
================

Celts Clan Arma 3 Altis Life RPG Multiplayer mission

This version of Altis Life is hosted by the guys at Celts Clan, I'm just a regular on the server who wants to help out a little.

Warning! This is a work in progress, I will put up more information when there is actually something to show :D

For specific Info please visit:
- Celts Clan: http://www.celtsclan.co.uk/
- Altis Life: http://www.altisliferpg.com/

How To Edit:
================
Ok first of all we need to get the mission into the Editor:
- simply create a shortcut of the AltisLife.Altis server and place it in your Arma 3 Other Profile user folder under MPMissions
- Start Arma 3 as always
- Go to Multiplayer and new
- Start a LAN server
- Select the Altis Life RPG and hit Edit
Tada! You now can move stuff, rename stuff and all kinds of other fun things to the mission!

Notes:
- 3d Editor for Altis Life? https://www.youtube.com/watch?v=wLuM6o4lPSo

How To Test:
================
The only way of actually testing this seems to be to run a full server and while I'm not a fan of installing all kinds of server hardware on to my machine just for testing purposes any other way seems a bit out of scope at this stage (see Extras). Will update this readme as soon as I have figured out a good way of doing this.

Notes:
- Altis Life Install guide: http://www.altisliferpg.com/topic/3783-tutorial-server-setup-extdb/
- Arma Server Monitor Linux: http://www.armaholic.com/page.php?id=26694

License and Stuff: 
================
This is not a fork of the original Altis Life repo you can find at https://github.com/TAWTonic/Altis-Life, all credit for this mod goes to the guys there especially Tonic himself. Depending on how things are going I might consider putting in the work to merge this into a fork but no guarantees.

Altis Life / Altis Life RPG is developed by Tonic / TAW_Tonic. This contains primarily the release contain and on-going development changes to the mission. Altis Life RPG by Tonic is licensed under a Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License http://creativecommons.org/licenses/by-nc-nd/3.0/deed.en_US


Extras:
================
ToDo: Find a better place for this

I've been giving it a run at setting up a Arma 3 Server in a Docker Container and overall it went quite well for the few hours I put into it, following the Linux Server guide I managed to get up to:
```
./arma3server -world=empty
```
Befor me calling it a day:
```
../lib/Network/networkServer.cpp ClearNetServer:NOT IMPLEMENTED - briefing!
[ERROR] cannot save. [filename]=/root/.local/share/Arma 3\Saved\steam\meta\cacheItems.map
File , line 0: '.': '▒' encountered instead of '='
```
However my suspicion is that this is related to a borked steam installation so whenever I take another look at this I should maybe take a look at this first https://developer.valvesoftware.com/wiki/SteamCMD#Linux.2FOS_X

The general idea behind this is to have a simple and easy to spin up Arma 3 Server with an additional layer for Altis Life which can be used to easily test changes to the mission and especially doesnt cause havok when crashing due to a borked script etc. Later on this could be expanded to a proper multi-container setup but just getting it all running in a single container would be already amazing.

Resources:
- Boot2Docker: https://github.com/boot2docker/boot2docker
- baseimage-docker: https://github.com/phusion/baseimage-docker
- Arma3 Linux Server Setup Guide: http://erictgrubaugh.com/play/games/arma/installation-and-configuration-of-an-arma-3-linux-dedicated-server/
