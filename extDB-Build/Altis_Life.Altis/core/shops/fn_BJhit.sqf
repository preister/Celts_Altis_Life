/*
	File: fn_BJhit.sqf
	Description: Blackjack
	Created by Blacklistgaming.org
        Coder: PapaBear
*/
//hit phase
//check value of cards
//stop if bust
//if 5th hit and still good win

disableSerialization;
_display = findDisplay 5980;


//setup variables
_Pcard1 = _display displayCtrl 5992;
_Pcard2 = _display displayCtrl 5993;
_Pcard3 = _display displayCtrl 5994;
_Pcard4 = _display displayCtrl 5997;
_Pcard5 = _display displayCtrl 5998;
_TOTALTXT = _display displayCtrl 6007;
_bet5KTEXT = _display displayCtrl 6003;
_bet10KTEXT = _display displayCtrl 6004;
_bet25KTEXT = _display displayCtrl 6005;
_bet50KTEXT = _display displayCtrl 6006;
_betamt = 0;

if( (ctrlText _bet5KText) != "" ) then
{
	_betamt = 5000;
}
else
{
	if( (ctrlText _bet10KText) != "" ) then
	{
		_betamt = 10000;
	}
	else
	{
		if( (ctrlText _bet25KText) != "" ) then
		{
			_betamt = 25000;
		}
		else
		{
			_betamt = 50000;
		};
	};
};

_gameover = false;
_bet1 = _display displayCtrl 5984;
_bet2 = _display displayCtrl 5985;
_bet3 = _display displayCtrl 5986;
_bet4 = _display displayCtrl 5987;
_Stay = _display displayCtrl 5982;
_Hit = _display displayCtrl 5983;
_winnings = _display displayCtrl 6001;
_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;
_Hit ctrlEnable false;
_Stay ctrlEnable false;

_P1T = ctrlText _Pcard1;
_P2T = ctrlText _Pcard2;
_P3T = ctrlText _Pcard3;
_P4T = ctrlText _Pcard4;
_P5T = ctrlText _Pcard5;

_ACES = false;
_ACE1 = 0;
_ACE2 = 0;
_ACE3 = 0;
_ACE4 = 0;
_total = 0;
_win = 0;
_cash = 0;

//figure out which card is next to be dealt
_NextCard = 0;
if(_P3T != "" ) then
{
	if(_P4T != "" ) then
	{		
		_NextCard = 5;
	}
	else
	{
		_NextCard = 4;
	};
}
else
{
	_NextCard = 3;
};

//deal next card
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

//assign card to its place
switch ( _NextCard ) do
{
	case 3: { _Pcard3 ctrlSetText format["%1",_number]; _P3T = ctrlText _Pcard3; };
	case 4: { _Pcard4 ctrlSetText format["%1",_number]; _P4T = ctrlText _Pcard4; };
	case 5: { _Pcard5 ctrlSetText format["%1",_number]; _P5T = ctrlText _Pcard5; };
	default { _Pcard3 ctrlSetText format["%1",_number]; _P3T = ctrlText _Pcard3; }
};



_totalAces = 0;
//check if there are any aces
//and where they are
if( _P1T == "ACE" ) then
{
	_ACES = true;
	_ACE1 = 1;
	_totalAces = 1;
};

if( _P2T == "ACE" ) then
{
	_ACES = true;
	if( _ACE1 == 0 ) then
	{
		_ACE1 = 2;
		_totalAces = 1;
	}
	else
	{
		_ACE2 = 2;
		_totalAces = 2;
	};
	
};

if( _P3T == "ACE" ) then
{
	_ACES = true;
	if( _ACE1 == 0 ) then
	{
		_ACE1 = 3;
		_totalAces = 1;
	}
	else
	{
		if( _ACE2 == 0 ) then
		{
			_ACE2 = 3;
			_totalAces = 2;
		}
		else
		{
			_ACE3 = 3;
			_totalAces = 3;
		};
		
	};
	
};

if( _P4T == "ACE" ) then
{
	_ACES = true;
	if( _ACE1 == 0 ) then
	{
		_ACE1 = 4;
		_totalAces = 1;
	}
	else
	{
		if( _ACE2 == 0 ) then
		{
			_ACE2 = 4;
			_totalAces = 2;
		}
		else
		{
			if( _ACE3 == 0 ) then
			{
				_ACE3 = 4;
				_totalAces = 3;
			}
			else
			{
				_ACE4 = 4;
				_totalAces = 4;
			};
		};
		
	};
	
};

if( _P5T == "ACE" ) then 
{	
	_ACES = true;
	if( _ACE1 == 0 ) then
	{
		_ACE1 = 5;
		_totalAces = 1;
	}
	else
	{
		if( _ACE2 == 0 ) then
		{
			_ACE2 = 5;
			_totalAces = 2;
		}
		else
		{
			if( _ACE3 == 0 ) then
			{
				_ACE3 = 5;
				_totalAces = 3;
			}
			else
			{		
				_ACE4 = 5;
				_totalAces = 4;
			};
		};
	};
};

	_temp1 = 0;
	_temp2 = 0;
//aces check complete.
//now we need total the players cards
//if there are aces we need to compare
// 11 vs 1 totals
// the total values of whether is 21 or under
if( _ACES ) then 
{
	if( _ACE4 != 5 OR _ACE3 != 5 OR _ACE2 != 5 OR _ACE1 != 5 ) then 
	{
		_total = _total + (parseNumber _P5T);
	};
	
	if( _ACE4 != 4 OR _ACE3 != 4 OR _ACE2 != 4 OR _ACE1 != 4 ) then 
	{
		_total = _total + (parseNumber _P4T);
	};
	
	if( _ACE3 != 3 OR _ACE2 != 3 OR _ACE1 != 3 ) then 
	{
		_total = _total + (parseNumber _P3T);
	};
	
	if( _ACE2 != 2 OR _ACE1 != 2 ) then 
	{
		_total = _total + (parseNumber _P2T);
	};
	
	if( _ACE1 != 1 ) then 
	{
		_total = _total + (parseNumber _P1T);
	};
	

	switch ( _totalAces ) do 
	{
		case 4:
		{
			//11,1,1,1 
			_temp1 = 14;
			//1,1,1,1
			_temp2 = 4;
		};
		case 3:
		{
			//11,1,1
			_temp1 = 13;
			//1,1,1
			_temp2 = 3;
		};
		case 2:
		{
			//11,1
			_temp1 = 12;
			//1,1
			_temp2 = 2;
		};
		case 1:
		{
			//11
			_temp1 = 11;
			//1
			_temp2 = 1;
		};
		default {_temp1 = 0; _temp2 = 0;}
	
	};
	
	_totalTemp = _total + _temp2;
	_total = _total + _temp1;
	
	//if player hit 21 then he wins 4X
	if( _total == 21 ) then
	{
		_TOTALTXT ctrlSetText format["%1",_total];
		_win = 4;
	}
	else
	{
		//player didnt hit 21
		//now check if he went bust using the 11
		//if he didnt then can keep playing
		if( _total > 21 ) then 
		{
			//using 11 he went over 21
			//lets check if he is still over using a 1 instead
			//if over 21 he loses, else keeps playing						
			if( _totalTemp > 21 ) then
			{
				_TOTALTXT ctrlSetText format["%1",_totalTemp];
				_gameover = true;
			}
			else
			{
				//if using 1 in total and still under 21
				//while using 5 cards, player wins 3X
				if( _NextCard == 5 ) then 
				{
					_win = 4;
				}
				else
				{				
					_TOTALTXT ctrlSetText format["%1",_totalTemp];
				};
			};
		}
		else
		{
			_TOTALTXT ctrlSetText format["%1",_total];
		};
	}; 
}
else
{	
	// NO ACES!!!! Total all cards
	_total = (parseNumber _P1T) + (parseNumber _P2T) + (parseNumber _P3T) + (parseNumber _P4T) + (parseNumber _P5T);
	_TOTALTXT ctrlSetText format["%1",_total];
	//if hit 21, win
	if( _total == 21 ) then
	{
		_win = 4;
		_gameover = true;
	}
	else
	{
		if( _total > 21 ) then 
		{
			_gameover = true;
		};
	};
};


//last check to see if they lose, win,still playing
if( _gameover ) then 
{
	if( _win != 0 ) then 
	{
		_cash = _betamt * _win;
		life_cash = life_cash + _cash;
		_winnings ctrlSetText  format["%1",_cash];
		
		//you win, give money
		//set text 
		//free up bet buttons
	}
	else
	{
		_winnings ctrlSetText "You lose. BUST";
		
		//you lose
		//set text
		//free up bet buttons
	};
	
	_bet1 ctrlEnable true;
	_bet2 ctrlEnable true;
	_bet3 ctrlEnable true;
	_bet4 ctrlEnable true;
	_bet5KTEXT  ctrlSetText "BET";
	_bet10KTEXT ctrlSetText "BET";
	_bet25KTEXT ctrlSetText "BET";
	_bet50KTEXT ctrlSetText "BET";
	_Hit ctrlEnable false;
	_Stay ctrlEnable false;

}
else
{

	
	//below 21, can still play
		//free up hit/stay buttons.
		
		_Hit ctrlEnable true;
		_Stay ctrlEnable true;
};