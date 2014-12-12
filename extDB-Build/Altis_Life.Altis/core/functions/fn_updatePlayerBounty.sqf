/*
	File: fn_updatePlayerBounty.sqf
	AKA: life_fnc_updatePlayerBounty
	Author: Patrick "SrgFlip" Reister
	
	Description:
	adds the transmitted value to the current bounty and triggers a hud update
*/
private["_bounty"];
_bounty = [_this,0,0,[0]] call BIS_fnc_param;
life_player_bounty = _bounty;
[] call life_fnc_hudUpdate;