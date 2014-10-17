/*
	File: fn_updatePlayerBounty.sqf
	AKA: life_fnc_updatePlayerBounty
	Author: Patrick "SrgFlip" Reister
	
	Description:
	adds the transmitted value to the current bounty and triggers a hud update
*/
private["_bountyToAdd"];
_bountyToAdd = _this select 0;
_reset = [_this,1,false,[false]] call BIS_fnc_param;
if (_reset) exitWith {life_player_bounty = 0;[] call life_fnc_hudUpdate;};
if !("SCALAR" == typeName _bountyToAdd) exitWith {};
life_player_bounty = life_player_bounty + _bountyToAdd;
[] call life_fnc_hudUpdate;