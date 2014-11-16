/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setups the hud for the player?
*/
private["_display","_alpha","_version","_p","_pg"];
disableSerialization;
_display = findDisplay 46;
_alpha = _display displayCtrl 1001;
_version = _display displayCtrl 1000;

2 cutRsc ["playerHUD","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];

//if we are a cop we dont want to see the crime symbol
if(playerSide == west) then {
	ctrlShow[23525,false];
} else {
	//ok lets fetch the bounty if there is one
	[[getPlayerUID player,"bountyCheck",["0", 0], true],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	//checks every minute if the player bounty has changed
	[] spawn
	{
		while {true} do
		{
			[[player,false],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;
			sleep 60; //to keep server strain down we only check every minute for an update
		};
	};
};

[] call life_fnc_hudUpdate;

//continuously checks for player health updates
[] spawn
{
	private["_dam"];
	while {true} do
	{
		_dam = damage player;
		waitUntil {(damage player) != _dam};
		[] call life_fnc_hudUpdate;
	};
};