/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts automated mining of resource from the tempest device.
*/
private["_vehicle","_resourceZones","_zone","_weight","_resource","_vInv","_itemIndex","_items","_space","_sum","_itemWeight","_val"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {hint localize "STR_NOTF_DeviceIsMining";}; //Mining is already in process..
closeDialog 0; //Close the interaction menu.
life_action_inUse = true; //Lock out the interaction menu for a bit..
_weight = [_vehicle] call life_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; life_action_inUse = false;};
//check if we are in the resource zone for any of the resources
_zone = "";
{
	_resource = _x;
	_resourceCfg = [_resource] call life_fnc_resourceCfg;
	_resourceZones = _resourceCfg select 0;
	// if there are no zones defined we are done here
	if (count _resourceZones == 0) exitWith {};
	_zoneSize = _resourceCfg select 1;
	_batchSize = _resourceCfg select 2;
	_requiredItem = _resourceCfg select 3;
	{
		if((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
	} forEach _resourceZones;
	//if we found a zone we are done here as well
	if(_zone != "") exitWith {};
} forEach resource_list;

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
	life_action_inUse = false;
};

if(_resource == "") exitWith {hint "Bad Resource?"; life_action_inUse = false;};
_vehicle setVariable ["mining",true,true]; //Lock the device
[_vehicle,"life_fnc_soundDevice",true,false] spawn life_fnc_MP; //Broadcast the 'mining' sound of the device for nearby units.

life_action_inUse = false; //Unlock it since it's going to do it's own thing...

while {true} do {
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	titleText[localize "STR_NOTF_DeviceMining","PLAIN"];
	_time = time + 27;
	
	//Wait for 27 seconds with a 'delta-time' wait.
	waitUntil {
		if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"]; true};
		if(round(_time - time) < 1) exitWith {true};
		sleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_resource,_items] call TON_fnc_index;
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_resource,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	_itemWeight = ([_resource] call life_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items set[count _items,[_resource,_sum]];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_resource,_val + _sum]];
	};
	
	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	
	//Locality checks...
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {
		[[_vehicle,(fuel _vehicle)-0.04],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
	};
	
	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	titleText[format[localize "STR_NOTF_DeviceMined",_sum],"PLAIN"];
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_resource,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	sleep 2;
};

_vehicle setVariable["mining",nil,true];