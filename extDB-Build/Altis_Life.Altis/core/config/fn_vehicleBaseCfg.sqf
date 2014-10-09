/*
If you need to know anything about a vehicle here it is, easily accessible and readable.
*/

_vehicleName = [_this,0,"",[""]] call BIS_fnc_param;
_whatInfo = [_this,1,[], []] call BIS_fnc_param; //instead of passing everytime all information back you can ask for something specific with this

_className = ""; //the class name of the vehicle
_colors = []; //array of the names of the colors you want to have active for the vehicle
_settingsFunction = ""; //to make vehicles completely modifiable we can select a way we want to vehicle to be spawned (with doors or without ? etc)
_yItemTrunkWeight = 0;

switch(_vehicleName): {
	case "cop_offroad": {
		_className = "C_Offroad_01_F"; //the base model so to say
		_colors = ["Cop"]; //these are the colors which will be available for this specific vehicle
		_settingsFunction = "life_fnc_cop_offroad"; //this takes care of the specific animation etc details (in prep for some more advanced functionality)
		_yItemTrunkWeight = 65; // how many yItems fit into this vehicle
		_buyPrice = 5000; // * 1.5 - currently still done in buy vehicle;
		_rentPrice = 5000; //not yet working buy price is still rental price * 1.5
		_retivalPrice = 2500; //how much does it cost to get the vehicle out of the garage aka fetch it from the DB
	};
	case "med_offroad": {
		_className = "C_Offroad_01_F"; //the base model so to say
		_colors = ["Medic"]; //these are the colors which will be available for this specific vehicle
		_settingsFunction = "life_fnc_medic_offroad"; //this takes care of the specific animation etc details (in prep for some more advanced functionality)
		_yItemTrunkWeight = 65; // how many yItems fit into this vehicle
		_buyPrice = 10000; // * 1.5 - currently still done in buy vehicle;
		_rentPrice = 10000; //not yet working buy price is still rental price * 1.5
		_retivalPrice = 2500; //how much does it cost to get the vehicle out of the garage aka fetch it from the DB
	};
	case "civ_offroad": {
		_className = "C_Offroad_01_F"; //the base model so to say
		_colors = ["Red","Yellow","White","Blue","Dark Red","Blue / White","Taxi"];
		_settingsFunction = "life_fnc_civ_offroad"; //this takes care of the specific animation etc details (in prep for some more advanced functionality)
		_yItemTrunkWeight = 65; // how many yItems fit into this vehicle
		_buyPrice = 12500; // * 1.5 - currently still done in buy vehicle;
		_rentPrice = 12500; //not yet working buy price is still rental price * 1.5
		_retivalPrice = 2500; //how much does it cost to get the vehicle out of the garage aka fetch it from the DB
	};
	case "civ_hummingbird": {
		_className = "B_Heli_Light_01_F"; //the base model so to say
		_colors = ["Black","Civ Blue","Civ Red","Blueline","Elliptical","Furious","Jeans Blue","Speedy Redline","Sunset","Vrana","Waves Blue"];
		_settingsFunction = "life_fnc_civ_hummingbird"; //this takes care of the specific animation etc details (in prep for some more advanced functionality)
		_yItemTrunkWeight = 65; // how many yItems fit into this vehicle
		_buyPrice = 253000; // * 1.5 - currently still done in buy vehicle;
		_rentPrice = 253000; //not yet working buy price is still rental price * 1.5
		_retivalPrice = 2500; //how much does it cost to get the vehicle out of the garage aka fetch it from the DB
	};
	case "civ_littlebird_benches": {};
	case "civ_orca": {};
	case "civ_quadbike": {};
	case "civ_hatchback": {};
	case "cop_suv": {};
	case "civ_suv": {};
	case "civ_van_transport": {};
	case "cop_hatchback_sport": {};
	case "civ_hatchback_sport": {};
	case "civ_van_box": {};
	case "civ_zamak_transport": {};
	case "civ_zamak_covered": {};
	case "civ_hemtt_transport": {};
	case "civ_tempest_transport": {};
	case "civ_tempest_covered": {};
	case "civ_hemtt_box": {};
	case "civ_tempest_device": {};
	case "reb_offroad": {};
	case "reb_ifrit_unarmed": {};
	case "reb_mohawk": {};
	case "cop_hunter_unarmed": {};
	case "cop_ghosthawk": {};
	case "civ_rubberboat": {};
	case "civ_boat": {};
	case "cop_rubberboat": {};
	case "cop_speedboat_armed": {};
	case "cop_minisubmarine": {};
};