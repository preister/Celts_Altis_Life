#include <macro.h>
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine
	Edited: SrgFlip
    
    Description:
    Loads saved player gear, if you want to limit anything for balancing do it in the save operation!
*/
private["_uniform","_vest","_backpack","_goggles","_headgear","_gear","_primary","_handgun",
	"_uniformItems","_backpackItems","_vestItems","_primaryItems","_handgunItems","_yItems",
	"_secondary","_uniformMags","_backpackMags","_vestMags","_handle", "_currentMaxWeight"
];
//we either get the items from the calling function or just use life_gear as default.
if(0 == (count life_gear)) then {
	//oh hello welcome new life
	life_gear = [playerSide] call life_fnc_defaultLoadouts;
};

if (__GETC__(life_debug_logLifeGear)) then {
	diag_log format["DEBUGLOG: loading gear: %1", life_gear];
};

waitUntil {!(isNull (findDisplay 46))};

[] call life_fnc_stripDownPlayer;
/////////////////////////////////////////////////////////////////////////////////////////
// THE ORDER OF THIS LIST IS VERY IMPORTANT, KEEP IN SYNC WITH SAVE GEAR AT ALL TIMES!
// If adding new items ALWAYS add them to the end of the list otherwise you need to clear
// the gear of all players in the db to prevent failures
/////////////////////////////////////////////////////////////////////////////////////////
_uniform = [life_gear,0,"",[""]] call BIS_fnc_param;
_vest = [life_gear,1,"",[""]] call BIS_fnc_param;
_backpack = [life_gear,2,"",[""]] call BIS_fnc_param;
_goggles = [life_gear,3,"",[""]] call BIS_fnc_param;
_headgear = [life_gear,4,"",[""]] call BIS_fnc_param;
_gear = [life_gear,5,[],[[]]] call BIS_fnc_param;
_primary = [life_gear,6,"",[""]] call BIS_fnc_param;
_handgun = [life_gear,7,"",[""]] call BIS_fnc_param;
_uniformItems = [life_gear,8,[],[[]]] call BIS_fnc_param;
_uniformMags = [life_gear,9,[],[[]]] call BIS_fnc_param; //UNUSED
_backpackItems = [life_gear,10,[],[[]]] call BIS_fnc_param;
_backpackMags = [life_gear,11,[],[[]]] call BIS_fnc_param; //UNUSED
_vestItems = [life_gear,12,[],[[]]] call BIS_fnc_param;
_vestMags = [life_gear,13,[],[[]]] call BIS_fnc_param; //UNUSED
_primaryItems = [life_gear,14,[],[[]]] call BIS_fnc_param;
_handgunItems = [life_gear,15,[],[[]]] call BIS_fnc_param;
_yItems = [life_gear,16,[],[[]]] call BIS_fnc_param;
_secondary = [life_gear,17,[],[[]]] call BIS_fnc_param;


//loads all the gear and items listed in the forEach Array (_gear itself is already an array so it just gets added)
{
	if (_x != "") then {
		[_x,true,false,false,false] call life_fnc_handleItem; 
	};
}forEach[_primary, _handgun, _goggles, _headgear, _uniform, _vest, _backpack] + _gear;

{
    if (_x != "") then {
        player addPrimaryWeaponItem _x;
    };
} foreach (_primaryItems);
{
    if (_x != "") then {
        player addHandgunItem _x;
    };
} foreach (_handgunItems);
//simplyfing this all items are handled the same no need to handled magazines specially as
// far as I can see
{player addItemToUniform _x;} foreach (_uniformItems);
{player addItemToVest _x;} foreach (_vestItems);
{player addItemToBackpack _x;} foreach (_backpackItems);
//and add the yitems up to the absolute maximum weight of 100
private["_currentMaxWeight", "_item"];
//reset the carry weight to 0, we are afterall just loading the yItems in
life_carryWeight = 0;
_currentMaxWeight = life_maxWeight;
life_maxWeight = 100;
{
	[true,_x,1] call life_fnc_handleInv;
} forEach (_yItems);
//and set it back to our original weight
life_maxWeight = _currentMaxWeight;