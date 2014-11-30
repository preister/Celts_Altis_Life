/*
	File: fn_getAGiftShop.sqf
	Author: Patrick "SrgFlip" Reister
	
	Description:
	Simple advent calendar - code needs to be changed to change the gift
	
	Players can visit this "Shop" and get a gift which currently is just set here via the _giftselect variable
	
	New Gifts can be added via the switch case and below another switch case makes sure that they are correctly 
	given to players based on their type. This way we can easily reuse gifts and configure new gifts ahead of time.
	
	The general idea is that most of the time we'll just have a normal cash payout and for special days we set up 
	special gifts for that particular day, change the code and update the server with the new gift for a limited amount of 
	time before changing the code again.
	
	PS. Just to keep track of this info: another way of doing this could simply involve a simple UI for Admins which lets 
	them configure the gift ingame to something other than the standard cash and going all overboard would be to do this
	via a DB implementation but important to remember here is that ARMA currently has no correlation of ingame time vs
	game time so figuring out what the current date is might require some C++ work.
*/
private["_player","_giftselect", "_giftinfo", "_shop", "_uid"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//make sure the function got called correctly
if ((_player == Nil) OR (_shop == Nil)) exitWith {};

_uid = getPlayerUID _player;

//lets make sure this only works ones per server restarts
_playerlist = _shop getVariable ["playerlist",[]];
if (_uid in _playerlist) exitWith { hint "Sorry works only ones per day :(!"; };

//configuration of the gift for the day
_giftselect = "";

//available gifts (so we can reuse them later on)
//gift types are:
// 0 : Money Cash [gift_type, cash_amount]
// 1 : Money ATM [gift_type, atm_amount]
// 2 : Gear / iItems [gift_type, "iItem name", gift_amount]
// 3 : yItems [gift_type, "yItem name", gift_amount]
_giftinfo = switch (_giftselect) do {
	case "cash_normal": {
		[
			0, //type
			100000 //cash amount
		]
	};
	case "1st Advent": {
		[
			3, //yItem
			"goldbar", //name
			1, //amount
		]
	};
	default: {[]};
};

if (_giftinfo == []) exitWith{ hint "Something is wrong with the gift info please inform you closest admin."};

//and based on the gift type we give it to the player:
switch (_giftinfo select 0) do {
	case 0: {
		life_cash = life_cash + _giftinfo select 1;
	};
	case 1: {
		life_atmcash = life_atmcash + _giftinfo select 1;
	};
	case 2: {
		for _i from 0 to (_giftinfo select 2) do {
			[_giftinfo select 1,true,false,false,false] call life_fnc_handleItem;
		};
	};
	case 3: {
		if !( [true,_giftinfo select 1,_giftinfo select 2] call life_fnc_handleInv ) exitWith { hint "Not enough space in your inventory, come back later"; };
	};
	case default: { exitWith { hint "No gift matching this type please inform you closest admin.";} };
};

//and save the new player inventory / money state
[] call life_fnc_saveGear;

//OK everything went fine lets make sure they dont get more before the next server restarts
_playerlist = set[count _playerlist, _uid];
_shop setVariable ["playerlist", _playerlist, true];