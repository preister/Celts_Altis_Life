/*
file: fn_crimesCfg.sqf
Author: SrgFlip
Altis Life 3.1.4.6 Celts Clan Version
Description:Easy way to configure crimes, add new ones or remove outdated ones.
*/

//configuration variables
// _description : a longer description of the crime
// _ticket : integer of the value of the ticket for this crime
private["_crime","_description", "_ticket"];
_crime = [_this,0,"",[""]] call BIS_fnc_param;

//TODO: Check if life_wanted_list is used to calculate the ticket price

//default values
_description = "Unconfigured Crime";
_ticket = 0;

switch(_crime) do {
	case ("187V"): {
		_description = "Vehicular Manslaughter";
		_ticket = 50000;
	};
	case ("187") : {
		_description = "Manslaughter";
		_ticket = 50000;
	}; 
	case ("901") : {
		_description = "Escaping Jail";
		_ticket = 30000;
	};
	case ("215") : {
		_description = "Attempted Auto Theft";
		_ticket = 25000;
	};
	case ("213") : {
		_description = "Use of illegal explosives";
		_ticket = 40000;
	};
	case ("211") : {
		_description = "Robbery";
		_ticket = 15000;
	};
	case ("211A") : {
		_description = "Attempted Robbery";
		_ticket = 15000;
	};
	case ("207") : {
		_description = "Kidnapping";
		_ticket = 40000;
	};
	case ("207A") : {
		_description = "Attempted Kidnapping";
		_ticket = 40000;
	};
	case ("487") : {
		_description = "Grand Theft";
		_ticket = 25000;
	};
	case ("488") : {
		_description = "Petty Theft";
		_ticket = 25000;
	};
	case ("480") : {
		_description = "Hit and run";
		_ticket = 5000;
	};
	case ("481") : {
		_description = "Drug Possession";
		_ticket = 25000; //Possession is equal to Intent to Distribute?
	};
	case ("482") : {
		_description = "Intent to distribute";
		_ticket = 25000;
	};
	case ("483") : {
		_description = "Drug Trafficking";
		_ticket = 25000;
	};
	case ("459") : {
		_description = "Burglary";
		_ticket = 25000;
	};
	case ("187A") : {
		_description = "Attempted murder";
		_ticket = 40000;
	};
	case ("123") : {
		_description = "Evading Arrest";
		_ticket = 20000;
	};
	case ("102") : {
		_description = "Possession of an illegal weapon";
		_ticket = 30000;
	};
	case ("103") : {
		_description = "Possession of an illegal vehicle";
		_ticket = 30000;
	};
	case ("104") : {
		_description = "Threatening an officer";
		_ticket = 15000;
	};
	case ("105") : {
		_description = "Bank Robbery";
		_ticket = 75000;
	};
	case ("106") : {
		_description = "Possession of explosives";
		_ticket = 40000;
	};
	case ("107") : {
		_description = "Disobeying an Officer";
		_ticket = 5000;
	};
	case ("108") : {
		_description = "Assault";
		_ticket = 20000;
	};
	case ("108P") : {
		_description = "Assault on Police";
		_ticket = 30000;
	};
	case ("109") : {
		_description = "Disturbing the peace";
		_ticket = 2500;
	};
	case ("110") : {
		_description = "Trespassing";
		_ticket = 2500;
	};
	case ("111") : {
		_description = "Driving without headlights";
		_ticket = 1000;
	};
	case ("112") : {
		_description = "Driving without a license";
		_ticket = 1000;
	};
};

[_description,_ticket];