/*
	File: fn_stripDownPlayer.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Description: Strip the player down
*/
private ["_valItem","_nameItem"];
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

if(hmd player != "") then {
	player unlinkItem (hmd player);
};

//and remove all yitems
{
	_valItem = missionNamespace getVariable _x;
	_nameItem = [_x,1] call life_fnc_varHandle;
	[false,_nameItem,_valItem] call life_fnc_handleInv;
} forEach life_inv_items;