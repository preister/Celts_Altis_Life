/*
	File: fn_updatePlayerBounty.sqf
	AKA: life_fnc_updatePlayerBounty
	Author: Patrick "SrgFlip" Reister
	
	Description:
	adds the transmitted value to the current bounty and triggers a hud update
*/
private["_bountyToAdd"];
_bountyToAdd = _this select 0;
if !("SCALAR" == typeName _bountyToAdd) exitWith {};
life_player_bounty = life_player_bounty + _bountyToAdd;
diag_log format["DEBUG: Bounty is now %1", life_player_bounty];
[] call life_fnc_hudUpdate;