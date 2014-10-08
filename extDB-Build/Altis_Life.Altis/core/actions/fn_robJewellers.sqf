/*
file: fn_robJewellers.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob jewellers action!
Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if(side _robber != civilian) exitWith { hint "You can not rob this jewellers!" };
if(_robber distance _shop > 5) exitWith { hint "You need to be within 5m of the jeweller to rob him!" };

if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { hint "Robbery already in progress!" };
if (vehicle player != _robber) exitWith { hint "Get out of your vehicle!" };

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "HaHa, you do not threaten me! Get out of here you hobo!" };
if (_kassa == 0) exitWith { hint "There is no cash in the register!" };

_rip = true;
_kassa = 30000 + round(random 45000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
hint "The cashier hit the alarm, police has been alerted!"; [[1,format["ALARM! - %1 is being robbed!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
 
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbery in Progress, stay close (3m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
	while{true} do
	{
		sleep 1.8;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Robbery in Progress, stay close (3m) (%1%2)...",round(_cP * 100),"%"];

		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 3.5) exitWith { };
		if!(alive _robber) exitWith {};
	};
	if!(alive _robber) exitWith { _rip = false; };
	if(_robber distance _shop > 3.5) exitWith { _shop switchMove ""; hint "You need to stay within 3m to rob the jewellers! - Now the registry is locked."; 5 cutText ["","PLAIN"]; _rip = false; };
	5 cutText ["","PLAIN"];

	titleText[format["You have stolen $%1, now get away before the cops arrive!",[_kassa] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _kassa;
	[[1,format["911 - %1 was just robbed by %2 for a total of $%3", _shop, _robber getVariable["realname",name _robber], [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	_rip = false;
	life_use_atm = false;
	sleep (10);
	life_use_atm = true;
	if!(alive _robber) exitWith {};
	[[1,format["NEWS: %1 was just robbed for a total of $%2", _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
	[_robber, "211"] call life_fnc_chargeCrime;
};
sleep 300;
_action = _shop addAction["Rob the Jewellers",life_fnc_robJewellers];
_shop switchMove "";