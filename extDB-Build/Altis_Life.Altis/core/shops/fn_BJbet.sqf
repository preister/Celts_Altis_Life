/*
	File: fn_BJbet.sqf
	Description: Blackjack
	Created by Blacklistgaming.org
        Coder: PapaBear
*/

private ["_betamt"];
_betamt = [_this,0,1,[0]] call BIS_fnc_param;
disableSerialization;
_display = findDisplay 5980;

if(life_cash < _betamt) exitWith {hint format["You don't have enough money to play (%1$)",_betamt];};
life_cash = life_cash - _betamt;


_Pcard1 = _display displayCtrl 5992;
_Pcard2 = _display displayCtrl 5993;
_Pcard3 = _display displayCtrl 5994;
_Pcard4 = _display displayCtrl 5997;
_Pcard5 = _display displayCtrl 5998;
_Dcard1 = _display displayCtrl 5990;
_Dcard2 = _display displayCtrl 5991;
_Dcard3 = _display displayCtrl 5995;
_Dcard4 = _display displayCtrl 5996;
_bet1 = _display displayCtrl 5984;
_bet2 = _display displayCtrl 5985;
_bet3 = _display displayCtrl 5986;
_bet4 = _display displayCtrl 5987;
_Stay = _display displayCtrl 5982;
_Hit = _display displayCtrl 5983;
_TOTALTXT = _display displayCtrl 6007;

	_Pcard1 ctrlSetText "";
	_Pcard2 ctrlSetText "";
	_Pcard3 ctrlSetText "";
	_Pcard4 ctrlSetText "";
	_Pcard5 ctrlSetText "";
	_Dcard1 ctrlSetText "";
	_Dcard2 ctrlSetText "";
	_Dcard3 ctrlSetText "";
	_Dcard4 ctrlSetText "";
	_TOTALTXT ctrlSetText "Total: ";


_bet5KTEXT = _display displayCtrl 6003;
_bet10KTEXT = _display displayCtrl 6004;
_bet25KTEXT = _display displayCtrl 6005;
_bet50KTEXT = _display displayCtrl 6006;
_total = 0;
_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;
_Hit ctrlEnable false;
_Stay ctrlEnable false;

switch ( _betamt ) do 
{
	case 5000:  { _bet10KTEXT ctrlSetText ""; _bet25KTEXT ctrlSetText ""; _bet50KTEXT ctrlSetText ""; };
	case 10000: { _bet5KTEXT ctrlSetText ""; _bet25KTEXT ctrlSetText ""; _bet50KTEXT ctrlSetText ""; };
	case 25000: { _bet10KTEXT ctrlSetText ""; _bet5KTEXT ctrlSetText ""; _bet50KTEXT ctrlSetText ""; };
	case 50000: { _bet10KTEXT ctrlSetText ""; _bet25KTEXT ctrlSetText ""; _bet5KTEXT ctrlSetText ""; };
	default { _bet10KTEXT ctrlSetText ""; _bet25KTEXT ctrlSetText ""; _bet50KTEXT ctrlSetText ""; }
};

// give dealer 1 card, other is XX 
// give player 2 cards

_number = ceil(random 11);
_number = _number + 2;

if ( _number == 11 OR _number == 12 ) then
{
	_number = 10;

}
else 
{
	if( _number == 13 ) then
	{
		_number = "ACE";
	};

};

_Pcard1 ctrlSetText format["%1",_number];

sleep 0.5;

_number = ceil(random 11);
_number = _number + 2;

if ( _number == 11 OR _number == 12 ) then
{
	_number = 10;

}
else 
{
	if( _number == 13 ) then
	{
		_number = "ACE";
	};

};

_Dcard1 ctrlSetText format["%1",_number];

sleep 0.5;

_number = ceil(random 11);
_number = _number + 2;

if ( _number == 11 OR _number == 12 ) then
{
	_number = 10;

}
else 
{
	if( _number == 13 ) then
	{
		_number = "ACE";
	};

};

_Pcard2 ctrlSetText format["%1",_number];

_P1 = ctrlText _Pcard1;
_P2 = ctrlText _Pcard2;
_D1 = ctrlText _Dcard1;

sleep 0.5;
_winnings = _display displayCtrl 6001;
_total = 0;
if( _P1 == "ACE" ) then
{
	if( _P2 == "10" ) then
	{
		_total = 21;
	}else
	{
		if( _P2 == "ACE" ) then
		{
			_total = 12;
		}
		else
		{
			_total = 11 + (parseNumber _P2);
		};
	};
}
else
{
	if( _P2 == "ACE" ) then
	{
		if( _P1 == "10" ) then 
		{
			_total = 21;
		}
		else
		{
			if( _P1 == "ACE" ) then
			{
				_total = 12;
			}
			else
			{
				_total = 11 + (parseNumber _P1);
			};
		
		};
	}
	else
	{
		_total = (parseNumber _P1) + (parseNumber _P2);
	
	};

};

_TOTALTXT ctrlSetText format["%1",_total];

if( _total == 21 ) then 
{ 
	_win = 4 * _betamt;
	life_cash = life_cash + _win;
	_winnings ctrlSetText format["%1",_win];
	
	_bet1 ctrlEnable true;
	_bet2 ctrlEnable true;
	_bet3 ctrlEnable true;
	_bet4 ctrlEnable true;
}
else
{

	_number = ceil(random 11);
	_number = _number + 2;

	//check if dealer got ace and then a 10.
	//10 then ace?
	
	if( _number == 13 ) then
	{
		_number = "ACE";
		if( _D1 == "10" ) then
		{		
			_Dcard2 ctrlSetText format["%1",_number];
			_winnings = _display displayCtrl 6001;
			_winnings ctrlSetText "You Lose. Dealer got Black Jack.";
			_bet1 ctrlEnable true;
			_bet2 ctrlEnable true;
			_bet3 ctrlEnable true;
			_bet4 ctrlEnable true;
		}
		else
		{
			_Dcard2 ctrlSetText "XX";
		};
	}
	else
	{
		if( _D1 == "ACE" ) then 
		{
			if( _number == 10 ) then 
			{
				_Dcard2 ctrlSetText format["%1",_number];
				_winnings = _display displayCtrl 6001;
				_winnings ctrlSetText "You Lose. Dealer got Black Jack.";
				_bet1 ctrlEnable true;
				_bet2 ctrlEnable true;
				_bet3 ctrlEnable true;
				_bet4 ctrlEnable true;
			}
			else
			{
				_Dcard2 ctrlSetText "XX";
			};
			
		}
		else
		{
			_Dcard2 ctrlSetText "XX";
		};
		
	};

	_Hit ctrlEnable true;
	_Stay ctrlEnable true;

};
