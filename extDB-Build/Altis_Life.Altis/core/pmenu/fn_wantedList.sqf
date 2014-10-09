#include <macro.h>
/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
private["_info","_display","_list","_units","_entry"];
disableSerialization;
_info = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayctrl 2401;
_units = [];
{
	_units set[count _units,_x getVariable["realname",name _x]];
} foreach playableUnits;

{
	_entry = _x;
	if((_entry select 0) in _units) then
	{
		_list lbAdd format["%1", _entry select 0];
		_list lbSetData [(lbSize _list)-1,str(_entry)];
	};
} foreach _info;

//lets add all civs to the crime list
_ctrl = getControl(2400,2405);
lbClear _ctrl;
{
	//only civilians and medics can be charged with a crime currently
	if(alive _x && (side _x in [civilian,independent])) then
	{
		_ctrl lbAdd format["%1",_x getVariable["realname",name _x]];
		_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
	};
} forEach playableUnits;


//fill the dropdown box with the available crimes
_ctrl = getControl(2400,2406);
lbClear _ctrl;
_crimesList = crimes_list;
for "_i" from 0 to count(_crimesList)-1 do {
	_crimesCode = _crimesList select _i;
	//we just need the description for now, depending on what Dubbz thinks I might add the value as well
	_crimeDescription = ([_crimesCode] call life_fnc_crimesCfg) select 0;
	//we print both the code and the description to help with RP
	_ctrl lbAdd format["%1 - %2",_crimesCode, _crimeDescription];
	_ctrl lbSetValue [(lbSize _ctrl)-1,_i];
};

ctrlSetText[2404,"Connection Established"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "No criminals";
};