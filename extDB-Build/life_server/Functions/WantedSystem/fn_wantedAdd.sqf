/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Patrick "SrgFlip" Reister
	
	Description:
	Adds or appends a unit to the wanted list.
	_checkBounty allows a player to user this function to set his or her own bounty level fe. at startup
*/
private["_uid","_type","_index","_data","_crimes","_val","_name","_checkBounty"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,[],[[]]] call BIS_fnc_param;
_checkBounty = [_this,3,false,[false]] call BIS_fnc_param;

if(_uid == "" OR (count _type == 0) OR _name == "") exitWith {}; //Bad data passed.

//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_val = _data select 3;
	//this bady just wants to know his or her bounty
	if (_checkBounty) exitWith {[[_val],"life_fnc_updatePlayerBounty",_uid,false] spawn life_fnc_MP;};
	_crimes = _data select 2;
	_crimes set[count _crimes,(_type select 0)];
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	if (_checkBounty) exitWith {}; //nothing to do the player isn't on the wanted_list
	life_wanted_list set[count life_wanted_list,[_name,_uid,[(_type select 0)],(_type select 1)]];
};