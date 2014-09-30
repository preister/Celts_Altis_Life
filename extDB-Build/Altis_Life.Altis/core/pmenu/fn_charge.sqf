/*
	File: fn_charge.sqf
	Author: Patrick "SrgFlip" Reister
	
	Description:
	Charge the selected player with selected Crime
*/
private["_display","_list","_uid"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_dataPlayer = lbData[2405,(lbCurSel 2405)];
_dataCrime = lbData[2406,(lbCurSel 2406)];
_dataPlayer = call compile format["%1", _dataPlayer];
diag_log format["DEBUG _dataCrime: %1", _dataCrime];
diag_log format["DEBUG _dataPlayer: %1", _dataPlayer];
//if(isNil "_data") exitWith {};
//if(typeName _data != "ARRAY") exitWith {};
//if(count _data == 0) exitWith {};
//
//_uid = _data select 1;
//[[_uid],"life_fnc_wantedPardon",false,false] spawn life_fnc_MP;