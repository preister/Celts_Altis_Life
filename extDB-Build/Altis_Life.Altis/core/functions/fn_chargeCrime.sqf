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

//we only need to send this over the wire if its not the player client doing it
_message = format["You are wanted for %1", _crimeInfo select 0];
_bountyAdd = _crimeInfo select 1;
if (_perpetrator == player) then {
	titleText[format["%1",_message],"PLAIN"];
	[_bountyAdd] call life_fnc_updatePlayerBounty;
} else {
	//and lets let the player know he or she is a bady and why
	[[2,_message],"life_fnc_broadcast",_perpetrator,false] spawn life_fnc_MP;
	//and we update the players crime_bounty so we can display it nicely on the ui without causing any unnecessary network traffic
	// (Just as an improvement, it would be possible to do this directly instead of the broadcast message to the player ... not sure yet which way is better)
	[[_bountyAdd],"life_fnc_updatePlayerBounty",_perpetrator,false] spawn life_fnc_MP;
};