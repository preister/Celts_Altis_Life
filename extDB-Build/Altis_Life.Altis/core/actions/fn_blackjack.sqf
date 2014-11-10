/*File: fn_blackjack.sqf
	Author: Le Rebellion KRinK

	Translated by cat24max
	Description:
	Create the Blackjack Guy

*/
_store = blackjack;
_denied1 = false;
_price = 2500;

if(life_cash < _price) exitWith {hint "You don't have enough money to play (2500$)";};
life_cash = life_cash - _price;
removeAllActions blackjack;



				hint "It's your turn! Good luck!";
				_number = ceil(random 10);
				_pplayer = _this select 0;
				if (_number == 0) then {robberyreward = 5000; hint "19! Not bad! Here's a small payout!";};
				if (_number == 1) then {robberyreward = 0; hint "18! That's pretty shit mate...";};
				if (_number == 2) then {robberyreward = 0; hint "8! Loser...";};						
				if (_number == 3) then {robberyreward = 0; hint "14! You can do better than that!..";};
				if (_number == 4) then {robberyreward = 0; hint "16! Ouch! Let's play another round...";};
				if (_number == 5) then {robberyreward = 0; hint "12! Incredible! My Nan plays better than you! ";};
				if (_number == 6) then {robberyreward = 0; hint "13! Ah, you've lost again... Too bad!";};
				if (_number == 7) then {robberyreward = 7500; hint "20! Lucky you! You've won some money...";};
				if (_number == 8) then {robberyreward = 0; hint "10! With that number you'll get...                         ...bugga all!";};
				if (_number == 9) then {robberyreward = 0; hint "11! You're not having much luck...";};
				if (_number == 10) then {robberyreward = 10000; hint "21!!! Jackpot!!";};
				life_action_inUse = true;
	

sleep 2;
_robberycash = robberyreward;
_timer = time + (1 * 5);	
_toFar = false;
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	hintSilent format["Stay here and wait until it's your turn.\n\nTime Remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _vault)];

	if(player distance _vault > 5) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {hint "You were tazed...";};
};

switch(true) do
{
	case (_toFar):
	{
		hint "You need to stay within 5 meters of the table.";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case (!alive player):
	{
		hint "You've lost the game because you died...";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case (life_istazed):
	{
		hint "You were tazed!..";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case ((round(_timer - time)) < 1):
	{
		hint format["You've won $%1.", _robberycash];
		life_cash = life_cash + _robberycash;
		_denied1 = false;
		life_action_inUse = false;
	};	
};

sleep 10;
blackjack addAction["Play Blackjack ($2500)",life_fnc_blackjack,"blackjack"];
life_action_inUse = false;