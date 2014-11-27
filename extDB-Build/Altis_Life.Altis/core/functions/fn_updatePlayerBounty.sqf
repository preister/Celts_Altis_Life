/*
	File: fn_updatePlayerBounty.sqf
	AKA: life_fnc_updatePlayerBounty
	Author: Patrick "SrgFlip" Reister
	
	Description:
	adds the transmitted value to the current bounty and triggers a hud update
*/
private["_bounty"];
_bounty = _this select 0;
if !("SCALAR" == typeName _bounty) exitWith {};
life_player_bounty = _bounty;
[] call life_fnc_hudUpdate;