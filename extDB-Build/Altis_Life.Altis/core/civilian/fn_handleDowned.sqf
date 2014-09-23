/*
	File: fn_handleDowned.sqf
	Author: Skalicon modded by Mahribar
	
	Description: Downed state for rubber bullets
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_isdowned = false;};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!life_isdowned) then
	{
		life_isdowned = true;
		player setDamage 0.5;
		
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{player addMagazine _x;} foreach _curMags;
		};
	
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		[[0,format["%1 was downed by rubber bullets.", name _unit, name _shooter]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 8;
		if(!(player getVariable "restrained")) then {
			[[player,"AinjPpneMstpSnonWrflDnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			sleep 22;
		};
		// Check Restrain every 15 seconds for "disableUserInput"
		// I´m sure, it can be done better. Haven´t find a better way until now.
		if(!(player getVariable "restrained")) then {
			sleep 15;
		};
		if(!(player getVariable "restrained")) then {
			sleep 15;
		};
		if(!(player getVariable "restrained")) then {
			sleep 15;
		};
		if(!(player getVariable "restrained")) then {
			sleep 15;
		};
		if (!(player getVariable "restrained")) then {
			[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		};
		disableUserInput false;
		detach player;
		life_isdowned = false;
		player allowDamage true;
	};
}
	else
{
	_unit allowDamage true;
	life_isdowned = false;
};