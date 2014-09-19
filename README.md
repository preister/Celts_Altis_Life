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
The only way of actually testing this seems to be to run a full server but I really dont want to clutter up my machine with MySQL and stuff so we'll have to go the virtual way :) and until I can actually make sure the stuff I change works this is only half the fun.
Luckily I already found a nice guide for setting up a basic Arma 3 sever on linux: http://erictgrubaugh.com/play/games/arma/installation-and-configuration-of-an-arma-3-linux-dedicated-server/ - plan is to just throw this roughtly into a Docker container running on a Boot2Docker VirtualBox and then layer a 2nd Image over it with the necessary additions to get Altis Life running and just have the mission folder exposed via a smb share, meaning I dont have to worry if the Server crashes hard - its just a container. (This will happen in another repo will throw the link later on in here.)

License and Stuff: 
================
This is not a fork of the original Altis Life repo you can find at https://github.com/TAWTonic/Altis-Life, all credit for this mod goes to the guys there especially Tonic himself. Depending on how things are going I might consider putting in the work to merge this into a fork but no guarantees.

Altis Life / Altis Life RPG is developed by Tonic / TAW_Tonic. This contains primarily the release contain and on-going development changes to the mission. Altis Life RPG by Tonic is licensed under a Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License http://creativecommons.org/licenses/by-nc-nd/3.0/deed.en_US
