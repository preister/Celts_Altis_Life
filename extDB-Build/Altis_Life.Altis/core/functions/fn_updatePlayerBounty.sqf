/*
	File: fn_updatePlayerBounty.sqf
	AKA: life_fnc_updatePlayerBounty
	Author: Patrick "SrgFlip" Reister
	
	Description:
	adds the transmitted value to the current bounty and triggers a hud update
*/
private["_bountyToAdd"];
_bountyToAdd = [_this,0,[""],[[""]]] call BIS_fnc_param;
if (_bountyToAdd == "") exitWith {/*NOT GOOD!*/};
life_player_bounty = life_player_bounty + _bountyToAdd;
[] call life_fnc_hudUpdate;