/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable ["restrained", false])) exitWith { hint "Player is already restrained."; };
//nobody can restrain themselves 
if(player == _unit) exitWith {};
//cops cant restrain each other
if ((side player == west) AND (side _unit == west)) exitWith {};
//civilians can zip-tie people
if (side player == civilian) then {
	if(life_inv_zipties < 1) exitWith { hint "You have no zip-ties."; };
	life_inv_zipties = life_inv_zipties - 1;
	_unit setVariable["ziptied",true,true];
	hint "You have zip-tied the citizen";
};
if(!isPlayer _unit) exitWith {};
//Broadcast!

_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
[[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;