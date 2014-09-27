/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering. - rewritten to work with a more user friendly configuration, as well as allowing easily to configure necessary items like pickaxe
*/
private["_gather","_itemWeight","_diff","_itemName","_batchSize","_resourceZones","_resourceCfg", "_zone", "_x", "_valRequiredItem", "_requiredItem", "_zoneSize", "_varItem", "_valItem"];
//Action is in use, exit before we do anything to prevent spamming. 
if(life_action_inUse) exitWith { hint "Don't spam the button!"; }; 
//we have a heavy loop ahead so we want to prevent people from spamming
life_action_inUse = true;

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

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
	life_action_inUse = false;
};

// if an item is required we need to check if we have that particular item in our inventory
if(_requiredItem == "") then {
	//to make the exitWith easier we assume that you have one
	_valItem = 1;
}
else {
	_varItem = [_requiredItem,0] call life_fnc_varHandle;
	_valItem = missionNamespace getVariable _varItem;
};
//lets check and exit with a nice message
if (_valItem < 1) exitWith {
	//TODO add translation string
	titleText[format["A %1 is required to gather %2.", _requiredItem, _gather],"PLAIN"];
	life_action_inUse = false;
};

//gather check??
if((vehicle player) != player) exitWith {/*hint localize "STR_NOTF_GatherVeh";*/};

_diff = [_gather,_batchSize,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {
	hint localize "STR_NOTF_InvFull";
	life_action_inUse = false;
};
//run gather animation 3 times (0,1,2)
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
