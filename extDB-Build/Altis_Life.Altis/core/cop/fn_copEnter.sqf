/*
	File: fn_copEnter.sqf
	Author: I dunno, I do not care!
	
	Description:
	Allows Cops to enter locked Vehicles
*/
if(playerSide != west) exitWith {};
private ["_position","_veh"];
_position = _this select 3;

switch (_position) do
{
	case "driver":
	{
		cursorTarget lock false;
		player action ["getInDriver", cursorTarget];
		cursorTarget lock true;
	};
	case "passenger":
	{
		cursorTarget lock false;
		player action ["getInCargo", cursorTarget];
		cursorTarget lock true;
	};
	case "gunner":
	{
		cursorTarget lock false;
		player action ["getIngunner", cursorTarget];
		cursorTarget lock true;
	};
	case "exit":
	{
		_veh = vehicle player;
		_veh lock false;
		player action ["getOut", _veh];
		_veh lock true;
	};
};