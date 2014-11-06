#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreAllItem.sqf
	Author: Patrick "SrgFlip" Reister
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_itemsStored","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_itemsToStore", "_itemsToStore_float"];
disableSerialization;

if((lbCurSel 3503) == -1) exitWith {hint "You need to select an item!";};
_ctrl = ctrlSelData(3503);
//this doesnt deal with money for now to keep it simple
if(_ctrl == "money") exitWith {hint "Store All does not work for money ... yet";};
if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "You cannot store that in anything but a land vehicle!"};

if(life_trunk_vehicle isKindOf "House_F") then 
{
	_mWeight = 0;
	{
		_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);
	} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} 
	else 
{
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight);
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;
_itemsToStore_float = ((_totalWeight select 0) - (_totalWeight select 1))  / _itemWeight;
//ok and now we need to round it down
_itemsToStore = round _itemsToStore_float;
//but we need to round down not just round
if (_itemsToStore_float < _itemsToStore) then
{
	_itemsToStore = _itemsToStore - 1;
};
//if there are no items to store we are done here
if ((_itemsToStore == -1) OR (_itemsToStore == 0)) exitWith {hint "The vehicle is already full!";};
_itemsStored = 0;
//while there is still a item of this type in the player inventory we need to continue
while{ (_itemsStored < _itemsToStore) } do
{
	//only take an item if there is actually one left in the player inventory and there is actually space for another item
	if !([false,_ctrl,1] call life_fnc_handleInv) exitWith {}; 
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl, 1]];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + 1]];
	};
	_itemsStored = _itemsStored + 1;
};
//adding an additional layer of checking - yeah I know that's bad style but ... :(
if (0 != _itemsStored) then {
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + (_itemWeight * _itemsStored)],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};