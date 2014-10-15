/*
	File: fn_questionDealer.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Patrick "SrgFlip" Reister
	
	Description:
	Questions the drug dealer and sets the sellers wanted.
*/
private["_sellers","_names"];
_sellers = (_this select 0) getVariable["sellers",[]];
if(count _sellers == 0) exitWith {hint localize "STR_Cop_DealerQuestion"}; //No data.
life_action_inUse = true;
_charged_sellers = [];
_names = "";
{
	if(_x select 1 > 150000) then
	{
		_val = round((_x select 2) / 16);
	};
	_seller = _x select 0;
	//we only want to charge people ones
	if !(_seller in _charged_sellers) then {
		[_seller, "483"] call life_fnc_chargeCrime;
		//remember the sellers we charged
		_charged_sellers set[count _charged_sellers, _seller];
		_names = _names + format["%1<br/>",_seller getVariable["realname", name _seller]];
	};
} foreach _sellers;

hint parseText format[(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names];
(_this select 0) setVariable["sellers",[],true];
life_action_inUse = false;