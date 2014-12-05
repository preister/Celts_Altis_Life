#include <macro.h>
/*
	File: fn_initFederalReserve.sqf
	AKA: life_fnc_initFederalReserve
	Author: Patrick "SrgFlip" Reister
	
	Description:
	locks the doors and spawns control and rest loops running on the server for the federal Reserve
*/

private["_dome","_rsb","_casino"];
_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;
