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

//creating the rsc Layer used in the info bar
_rscLayer = "infoBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["infoBar","PLAIN"];
systemChat format["Loading game server info...", _rscLayer];

//status bar and setting some general variables for gameplay based on player count (fe. see https://github.com/preister/Celts_Altis_Life/issues/117)
[] spawn
{
	private ["_message"];
	sleep 5;
	while {true} do
	{
		life_count_cops = (west countSide playableUnits);
		life_count_medics = (independent countSide playableUnits);
		life_count_civs = (civilian countSide playableUnits);
		_message = "";
		//conditions under which we want to see the info Bar, currently we hide the info if the player is dead
		if (alive player) then {
			_message = format["FPS: %1 \nGRID: %2 \nAlt.: %3m \nCops: %4 \nCivs: %5 \nMedics: %6", 
				round diag_fps, // %1
				mapGridPosition player, // %2
				round ((getPosASL player) select 2), // %3
				life_count_cops, // %4
				life_count_civs, // %5
				life_count_medics // %6
			];
		};
		((uiNamespace getVariable "infoBar")displayCtrl 1000)ctrlSetText _message;
		sleep 1;
	};
};