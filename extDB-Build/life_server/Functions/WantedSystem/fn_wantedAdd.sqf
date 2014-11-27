/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Patrick "SrgFlip" Reister
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_name","_checkBounty"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,[],[[]]] call BIS_fnc_param;

if(_uid == "" OR (count _type == 0) OR _name == "") exitWith {}; //Bad data passed.

//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then {
	//uh hello fellow we know you already!
	_data = life_wanted_list select _index;
	_val = (_type select 1) + (_data select 3);
	_crimes = _data select 2;
	_crimes set[count _crimes,(_type select 0)];
} else {
	//oh a first timer
	_index = count life_wanted_list;
	_crimes = [(_type select 0)];
	_val = _type select 1;
};
life_wanted_list set[_index,[_name,_uid,_crimes,_val]];
//directly update the players bounty display, this way a player can see if there is a difference between the ticket value and his or her
// actual bounty, especially in a situations were a cop charges players manually
[[_val],"life_fnc_updatePlayerBounty",_uid,false] spawn life_fnc_MP;