//charges a crime to a player and make sure that the crime actually exists
//this is mostly intended to collect the code which has been spread all over the place
//in different configurations - especially for code which interacts with the server
//uniformity is great
//
//also this makes it easy to add a feature which lets a player know when charged with a crime

private["_cimeCode","_perpetrator"];
_cimeCode = [_this,0,"",[""]] call BIS_fnc_param;
_perpetrator = [_this,0,"",[""]] call BIS_fnc_param;

//if the crime is not on the list we can't charge it
if(!(_cimeCode in crimes_list)) exitWith {};

[[getPlayerUID _perpetrator,_perpetrator getVariable["realname",name _perpetrator],_cimeCode],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;