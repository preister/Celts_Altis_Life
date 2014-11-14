#include <macro.h>
/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
	Edited: SrgFlip
    
    Description:
    collect all the player gear in a nice list which we can afterwards store in the db
*/
//private for the variables used in the entire file, other privates specify variables which are just used in subsections to keep it readable
private["_uniform","_vest","_backpack","_goggles","_headgear","_gear","_primary","_handgun",
	"_uniformItems","_backpackItems","_vestItems","_primaryItems","_handgunItems","_yItems",
	"_secondary","_primaryMag","_handgunMag","_secondaryMag","_handled","_var","_val", "_name"
];

//in output array order
_uniform = uniform player;
//until I find a better way of doing this we need to make sure the rangemaster uniform gets reskinned correctly hear as well as in handleItem
// fe if somebody picks up a uniform we want it directly reskinned and not when we finally load Gear again.
// JUST TO MAKE THIS CLEAR THIS NEEDS CLEANING UP BEFORE WE ADD ANY MORE CLOTHING OR GEAR SKINS!
if(_uniform == "U_Rangemaster") then {
	private["_texture"];
	_texture = "";
	switch(playerSide) do {
		case independent: {
			_texture = "textures\medic_uniform.jpg";
		};
		case west: {
			_texture = "textures\police_uniform_co.jpg";
		};
	};
	if(_texture != "") then {
		_handle = [[player,0,_texture],"life_fnc_setTexture",true,false] spawn life_fnc_MP;{scriptDone _handle};
	};
};
if(_uniform == "U_B_CombatUniform_mcam") then {
	private["_texture"];
	_texture = "";
	switch(playerSide) do {
		case west: {
			_texture = "textures\swat_shirt.paa";
		};
	};
	if(_texture != "") then {
		_handle = [[player,0,_texture],"life_fnc_setTexture",true,false] spawn life_fnc_MP;{scriptDone _handle};
	};
};
_vest = vest player;
_backpack = backpack player;
_goggles = goggles player;
_headgear = headgear player;
_gear = assignedITems player; //like Compass or GPS
_primary = "";
_handgun = "";
_uniformItems = [];
_backpackItems = [];
_vestItems = [];
_primaryItems = [];
_handgunItems = [];
_yItems = [];
_secondary = [];

_primaryMag = "";
_handgunMag = "";
_secondaryMag = "";

if ((playerSide == west) || __GETC__(life_save_civ)) then {
	_primary = primaryWeapon player;
	if(_primary != "") then
	{
		_primaryItems = primaryWeaponItems player;
		if(count (primaryWeaponMagazine player) > 0) then
		{
			_primaryMag = ((primaryWeaponMagazine player) select 0);
		};
	};
	_handgun = handgunWeapon player;
	if(_handgun != "") then
	{
		_handgunItems = handgunItems player;
		if(count (handgunMagazine player) > 0) then
		{
			_handgunMag = ((handgunMagazine player) select 0);
		};
	};
	//secondary seems to be broken?
	//_secondary = secondaryWeapon player;
	//if(_secondary != "") then
	//{
	//	//secondaries don't have additional items it seems
	//	if((count (secondaryWeaponMagazineplayer player) > 0) && (alive player)) then
	//	{
	//		_secondaryMag = ((secondaryWeaponMagazineplayer player) select 0);
	//	};
	//};
};
//take care of carried items, and especially before we store any additional items in them
if(_uniform != "") then {_uniformItems = uniformItems player;};
if(_backpack != "") then {_backpackItems = backpackItems player;};
if(_vest != "") then {_vestItems = vestItems player;};

//now add those magazines to the normal items wherever there is space, simple way for the player
// to keep the mags and at the same time this means you cant just directly shoot after being fe. revived
_handled = false;
{
	if(_x != "") then
	{
		if(player canAddItemToVest _x) then
		{
			_vestItems = _vestItems + [_x];
			_handled = true;
		};
		if((player canAddItemToUniform _x) && !_handled) then
		{
			_uniformItems = _uniformItems + [_x];
			_handled = true;
		};
		if((player canAddItemToBackpack _x) && !_handled) then
		{
			_backpackItems = _backpackItems + [_x];
			_handled = true;
		};
	};
} forEach[_primaryMag,_handgunMag,_secondaryMag];
//we dont need to run through this long thing if save yItems is deactivated
if(__GETC__(life_save_yinv)) then {
	{
		_var = _x;
		_val = missionNamespace getVariable _var;
		_name = [_var,1] call life_fnc_varHandle;
		//check if the item is illegal - we only save legal stuff
		{
			_illegal = _x select 0;
			if(_name == _illegal) exitWith {_val = 0};
		} forEach life_illegal_items;
		if (_val > 0) then {
			for "_i" from 1 to _val do {
				_yItems = _yItems + [_name];
			};
		};
	} forEach life_inv_items;
};

/////////////////////////////////////////////////////////////////////////////////////////
// THE ORDER OF THIS LIST IS VERY IMPORTANT, KEEP IN SYNC WITH LOAD GEAR AT ALL TIMES!
// If adding new items ALWAYS add them to the end of the list otherwise you need to clear
// the gear of all players in the db to prevent failures
/////////////////////////////////////////////////////////////////////////////////////////
life_gear = [
	_uniform,
	_vest,
	_backpack,
	_goggles,
	_headgear,
	_gear,
	_primary,
	_handgun,
	_uniformItems,
	[], //_uniformMags UNUSED
	_backpackItems,
	[], // _backpackMags UNUSED
	_vestItems,
	[], // _vestMags UNUSED
	_primaryItems,
	_handgunItems,
	_yItems,
	_secondary
];

if (__GETC__(life_debug_logLifeGear)) then {
	diag_log format["DEBUGLOG: Saving gear: %1", life_gear];
};