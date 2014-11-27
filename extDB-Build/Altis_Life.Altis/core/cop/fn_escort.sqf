/*
	File: fn_escort.sqf
	AKA: life_fnc_escort.sqf
	Author: Patrick "SrgFlip" Reister
	
	Description:
	runs to check the escorting state of the player.
*/
private["_cop"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

if !(player getVariable["restrained",FALSE]) exitWith {};

//this loop runs until the player gets unrestrained or dies	
while {player getVariable "Escorting"} do
{
	if(!alive _cop) exitWith {
		[player] call life_fnc_stopEscorting;
	};
};