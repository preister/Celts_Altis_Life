#include <macro.h>
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse","_handle"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

//Only if the player doesn't keep the gear we remove the weapon (so we don't duplicate it)
//if(!(playerSide in life_death_save_gear)) then {
//	private["_containers"];
//	_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
//	{deleteVehicle _x;} forEach _containers; //Delete the containers.
//};

//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.
if(playerSide in life_death_save_gear) then {
	[] spawn life_fnc_loadGear;
};

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_setupActions;
[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;