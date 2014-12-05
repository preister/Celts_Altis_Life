#include <macro.h>
/*
	File: fn_initCasino.sqf
	AKA: life_fnc_initCasino
	Author: Patrick "SrgFlip" Reister
	
	Description:
	locks the doors and spawns control and rest loops running on the server for the Casino
*/

private["_casino"];
_casino = nearestObject [[16733.254,13591.961,0],"Land_Offices_01_V1_F"];

//closing all the doors for now, we need to figure out which ones we need to leave open
for "_i" from 1 to 6 do {_casino setVariable[format["bis_disabled_Door_%1",_i],1,true];};
_casino allowDamage false;