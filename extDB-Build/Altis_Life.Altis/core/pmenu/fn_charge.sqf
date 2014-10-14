/*
	File: fn_charge.sqf
	Author: Patrick "SrgFlip" Reister

	Description:
	Charge the selected player with selected Crime
*/
private["_unit","_crime","_infoCrime"];

if((lbCurSel 2406) == -1) exitWith {hint "No crime selected!";ctrlShow[2001,true];};
_crime = lbCurSel 2406;
_crime = call compile format["%1", _crime];
if((lbCurSel 2405) == -1) exitWith {hint "No one was selected!";ctrlShow[2001,true];};
_unit = lbData [2405,lbCurSel 2405];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};

_crime = crimes_list select _crime;
//the unit must have disappeared between the Wanted list being created and the  
[_unit, _crime] call life_fnc_chargeCrime;
_infoCrime = [_crime] call life_fnc_crimesCfg;
hint format["Charged player: %1 with a %2 - %3", _unit getVariable["realname",name _unit], _crime, _infoCrime select 0];