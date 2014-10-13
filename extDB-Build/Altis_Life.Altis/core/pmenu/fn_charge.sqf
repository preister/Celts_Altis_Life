/*
	File: fn_charge.sqf
	Author: Patrick "SrgFlip" Reister

	Description:
	Charge the selected player with selected Crime
*/
private["_display","_list","_unitNamePlayer","_dataCrime","_codeCrime","_infoCrime","_unitPlayer"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_unitNamePlayer = lbData([2405, lbCurSel 2405]);
_dataCrime = lbCurSel 2406;
_dataCrime = call compile format["%1", _dataCrime];
_unitNamePlayer = call compile format["%1", _unitNamePlayer];
//if no player is selected we can do nothing
if ("" == _unitNamePlayer) exitWith{};
_codeCrime = crimes_list select _dataCrime;
_infoCrime = [_codeCrime] call life_fnc_crimesCfg;
_unitPlayer = objNull;
{
	//lets find the player unit with this name
	if(_unitNamePlayer == name _x) exitWith {_unitPlayer = _x};
}forEach playableUnits;
//the unit must have disappeared between the Wanted list being created and the  
if (isNull == _unitPlayer) exitWith{ hint "Player List outdated, please try again."; };
[_unitPlayer, _codeCrime] call life_fnc_chargeCrime;
hint format["Charged player: %1 with a %2 - %3", _unitPlayer getVariable["realname",_unitNamePlayer], _codeCrime, _infoCrime select 0];