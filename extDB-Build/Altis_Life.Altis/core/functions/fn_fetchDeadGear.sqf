/*
	File: fn_fetchDeadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches gear off of a body.
*/
private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems", "_yitems","_headgear","_goggles","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = primaryWeapon _unit;
_launcher = secondaryWeapon _unit;
_handgun = handGunWeapon _unit;
_magazines = [];
_uniform = uniform _unit;
_vest = vest _unit;
_backpack = backpack _unit;
_items = assignedItems _unit;
if(primaryWeapon _unit != "") then {_primitems = primaryWeaponItems _unit;};
if(handgunWeapon _unit != "") then {_handgunItems = handgunItems _unit;};
_headgear = headgear _unit;
_goggles = goggles _unit;
_uitems = [];
_vitems = [];
_bitems = [];
_yitems = [];
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems _unit);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems _unit);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems _unit);};
	
if(primaryWeapon _unit != "") then
{
	_unit selectWeapon (primaryWeapon _unit);
	if(currentMagazine _unit != "") then
	{
		_magazines set[count _magazines,currentMagazine _unit];
	};
};
		
if(secondaryWeapon _unit != "") then
{
	_unit selectWeapon (secondaryWeapon _unit);
	if(currentMagazine _unit != "") then
	{
		_magazines set[count _magazines,currentMagazine _unit];
	};
};
		
if(handgunWeapon _unit != "") then
{
	_unit selectWeapon (handgunWeapon _unit);
	if(currentMagazine _unit != "") then
	{
		_magazines set[count _magazines,currentMagazine _unit];
	};
};
_unit selectWeapon (primaryWeapon _unit);

if(isNil "_handgunItems") then {_handgunItems = ["","",""];};

//and the yitems, or rather whats left of them after dropping
{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yitems = _yitems + [_name];
        };
    };
} forEach [
    ["life_inv_apple", life_inv_apple],
    ["life_inv_rabbit", life_inv_rabbit],
    ["life_inv_salema", life_inv_salema],
    ["life_inv_ornate", life_inv_ornate],
    ["life_inv_mackerel", life_inv_mackerel],
    ["life_inv_tuna", life_inv_tuna],
    ["life_inv_mullet", life_inv_mullet],
    ["life_inv_catshark", life_inv_catshark],
    ["life_inv_fishingpoles", life_inv_fishingpoles],
    ["life_inv_water", life_inv_water],
    ["life_inv_donuts", life_inv_donuts],
    ["life_inv_turtlesoup", life_inv_turtlesoup],
    ["life_inv_coffee", life_inv_coffee],
    ["life_inv_fuelF", life_inv_fuelF],
    ["life_inv_fuelE", life_inv_fuelE],
    ["life_inv_pickaxe", life_inv_pickaxe],
    ["life_inv_tbacon", life_inv_tbacon],
    ["life_inv_lockpick", life_inv_lockpick],
    ["life_inv_redgull", life_inv_redgull],
    ["life_inv_peach", life_inv_peach],
    ["life_inv_spikeStrip", life_inv_spikeStrip],
    ["life_inv_defusekit", life_inv_defusekit],
    ["life_inv_storagesmall", life_inv_storagesmall],
    ["life_inv_storagebig", life_inv_storagebig],
	["life_inv_zipties", life_inv_zipties]
];

[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_yitems,_headgear,_goggles];