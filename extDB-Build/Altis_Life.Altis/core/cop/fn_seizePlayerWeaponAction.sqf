/*
	File: fn_seizePlayerWeaponAction.sqf
	Author: Skalicon
	
	Description:
	Removes the players weapons client side
*/
removeAllWeapons player;
[] call life_fnc_saveGear;
[] call SOCK_fnc_updateRequest; //Should make weapon remove persistent
[] call life_fnc_loadGear;
titleText["The weapons have been confiscated.","PLAIN"];