#include <macro.h>
/*
    File: fn_defaultLoadouts.sqf
    Author: Patrick 'SrgFlip' Reister
    
    Description:
    describes the default loadouts for each side, defaults are set in the beginning 
	add any side specific changes in the switch case
*/
private["_playerSide","_uniform","_vest","_backpack","_goggles","_headgear","_gear","_primary","_handgun",
	"_uniformItems","_backpackItems","_vestItems","_primaryItems","_handgunItems","_yItems",
	"_secondary","_primaryMag","_handgunMag","_secondaryMag","_handled","_var","_val", "_name"
];
_playerSide = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_uniform = "U_Rangemaster";
_vest = "";
_backpack = "";
_goggles = "";
_headgear = "";
_gear = ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];
_primary = "";
_handgun = "";
_uniformItems = [];
_backpackItems = [];
_vestItems = [];
_primaryItems = [];
_handgunItems = [];
_yItems = [];
_secondary = [];

/*
	CHANGE DEFAULT LOADOUTS HERE, for available options see default variables above
*/
switch(playerSide) do
{
	//cops keep their gear
	case west: {
		_vest = "V_Rangemaster_belt";
		_handgun = "hgun_P07_snds_F";
		_vestItems = ["16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag"];
	};
	case civilian: {
		private["_clothes"];
		//civs get randomly a uniform assigned from this array
	    _clothes = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
		_uniform = "U_Rangemaster" = _clothes select (floor(random (count _clothes)));
	};
	case independent: {
		_uniformItems = ["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"];
	};
};

//ok lets give it back to loadGear so we can get fitted out with it
/////////////////////////////////////////////////////////////////////////////////////////
// THE ORDER OF THIS LIST IS VERY IMPORTANT, KEEP IN SYNC WITH LOAD GEAR AT ALL TIMES!
// If adding new items ALWAYS add them to the end of the list otherwise you need to clear
// the gear of all players in the db to prevent failures
/////////////////////////////////////////////////////////////////////////////////////////
[
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