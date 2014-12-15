/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by SrgFlip
	Description:
	Main functionality for gathering. - rewritten to work with a more user friendly configuration, as well as allowing easily to configure necessary items like pickaxe
*/
private["_gather","_itemWeight","_diff","_itemName","_batchSize","_resourceZones","_resourceCfg", "_zone", "_x", "_valRequiredItem", "_requiredItem", "_zoneSize", "_varItem", "_valItem", "_startpos", "_difftotal"];

//check if we are in the resource zone for any of the resources
_zone = "";
{
	_gather = _x;
	_resourceCfg = [_gather] call life_fnc_resourceCfg;
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

if(_zone == "") exitWith {};

// if an item is required we need to check if we have that particular item in our inventory
if(_requiredItem == "") then {
	//to make the exitWith easier we assume that you have one
	_valItem = 1;
}
else {
	_varItem = [_requiredItem,0] call life_fnc_varHandle;
	_valItem = missionNamespace getVariable _varItem;
};

_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
//lets check and exit with a nice message
if (_valItem < 1) exitWith {
	//TODO add translation string
	titleText[format["A %1 is required to gather %2(s).", _requiredItem, _itemName],"PLAIN"];
};

//gather check??
if((vehicle player) != player) exitWith {/*hint localize "STR_NOTF_GatherVeh";*/};

titleText["Starting gathering, stand still ..." ,"PLAIN"];
_startpos = getPos player;
_difftotal = 0;
while {true} do {
	sleep 5;
	if(player distance _startpos > 3) exitWith { titleText[format["... gathering cancelled."],"PLAIN"]; };
	_diff = [_gather,_batchSize,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_diff == 0) exitWith { titleText[format["... inventory full, gathered %2 %1(s) in total.", _itemName,_difftotal],"PLAIN"]; };
	if(([true,_gather,_diff] call life_fnc_handleInv)) then
	{
		_difftotal = _difftotal + _diff;
		titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_difftotal],"PLAIN"];
	};
};