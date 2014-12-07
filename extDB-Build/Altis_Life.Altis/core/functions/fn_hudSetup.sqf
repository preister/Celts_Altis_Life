/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setups the hud for the player?
*/
private["_display","_alpha","_version","_p","_pg","_crimeIcon"];
disableSerialization;
_display = findDisplay 46;
_alpha = _display displayCtrl 1001;
_version = _display displayCtrl 1000;
_crimeIcon = _display displayCtrl 23525;

2 cutRsc ["playerHUD","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];

//if we are a cop we dont want to see the crime symbol
if(playerSide == west) then {
	_crimeIcon ctrlShow false;
} else {
	//checks every minute if the player bounty has changed
	[] spawn
	{
		while {true} do
		{
			[[player,false],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;
			//this is just a secondary check to update a players bounty, if a player
			//is charged with a crime the hud gets updated straight away
			sleep 60;
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

//contentiously check player count per side
[] spawn
{
	private ["_cops", "_medics", "_civs"];
	while {true} do
	{
		_cops = 0;
		_medics = 0;
		_civs = 0;
		{
			switch (side _x) do {
				case west: {_cops = _cops + 1};
				case independent: {_medics = _medics + 1};
				case civilian: {_civs = _civs + _civs};
			};
		} forEach playableUnits;
		life_count_cops = _cops;
		life_count_medics = _medics;
		life_count_civs = _civs;
		//update this every 10 seconds
		sleep 10;
	};
};