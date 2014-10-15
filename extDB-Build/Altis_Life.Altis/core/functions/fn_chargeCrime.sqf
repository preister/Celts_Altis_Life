//charges a crime to a player and make sure that the crime actually exists
//this is mostly intended to collect the code which has been spread all over the place
//in different configurations - especially for code which interacts with the server
//uniformity is great
//
//also this makes it easy to add a feature which lets a player know when charged with a crime

private["_crimeCode","_perpetrator","_crimeInfo"];
_perpetrator = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_crimeCode = [_this,1,"",[""]] call BIS_fnc_param;

//if the crime is not on the list we can't charge it
if!(_crimeCode in crimes_list) exitWith {};

_crimeInfo = [_crimeCode] call life_fnc_crimesCfg;

[[getPlayerUID _perpetrator,_perpetrator getVariable["realname",name _perpetrator],[_crimeCode, _crimeInfo select 1]],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

//and lets let the player know he or she is a bady and why
[[2,format["You are wanted for %1", _crimeInfo select 0]],"life_fnc_broadcast",_perpetrator,false] spawn life_fnc_MP;