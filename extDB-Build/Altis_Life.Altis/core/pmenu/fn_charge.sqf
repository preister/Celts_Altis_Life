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
_dataPlayer = lbData([2405, lbCurSel 2405]);
_dataCrime = lbCurSel 2406;
_dataCrime = call compile format["%1", _dataCrime];
_dataPlayer = call compile format["%1", _dataPlayer];
_crime = crimes_list select _dataCrime;
_unitPlayer = "";
diag_log format["DEBUG _dataCrime: %1", _crime];
diag_log format["DEBUG _dataPlayer: %1", _dataPlayer];
{
	//lets find the player unit with this name
	if(_dataPlayer == _x) exitWith {_unitPlayer = _x};
}forEach playableUnits; 

diag_log format ["PlayerInfo: %1", _unitPlayer];
diag_log format ["realname: %1", _unitPlayer getVariable["realname",_dataPlayer]];

[_dataPlayer, _dataCrime] call life_fnc_chargeCrime;
hint format["Charged player: %1 with a %2", _unitPlayer getVariable["realname",_dataPlayer], _dataCrime];