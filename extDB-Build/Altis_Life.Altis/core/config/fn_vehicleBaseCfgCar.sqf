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
	/*************************************************
	COPS
	*************************************************/
	case "cop_offroad": {
		_className = "C_Offroad_01_F"; //the base model so to say
		_colors = ["Cop"]; //these are the colors which will be available for this specific vehicle
		_settingsFunction = "life_fnc_offroad_cop"; //this takes care of the specific animation etc details (in prep for some more advanced functionality)
		_yItemTrunkWeight = 65; // how many yItems fit into this vehicle
		_buyPrice = 5000; // * 1.5 - currently still done in buy vehicle;
		_rentPrice = 5000; //not yet working buy price is still rental price * 1.5
		_retivalPrice = 2500; //how much does it cost to get the vehicle out of the garage aka fetch it from the DB
		_sellPrice = 6500; //how much does a player get back when selling the vehicle
	};
	case "cop_suv": {
		_className = "C_SUV_01_F";
		_colors = ["Black","Cop"];
		_settingsFunction = "life_fnc_suv_cop";
		_yItemTrunkWeight = 50;
		_buyPrice = 20000;
		_rentPrice = 20000;
		_retivalPrice = 5250;
		_sellPrice = 15000;
	};
	case "cop_hatchback_sport": {};
	case "cop_hunter_unarmed": {};
	/*************************************************
	MEDICS
	*************************************************/
	case "med_offroad": {
		_className = "C_Offroad_01_F";
		_colors = ["Medic"];
		_settingsFunction = "life_fnc_offroad_med";
		_yItemTrunkWeight = 65;
		_buyPrice = 10000;
		_rentPrice = 10000;
		_retivalPrice = 2500;
		_sellPrice = 6500;
	};
	/*************************************************
	CIVS
	*************************************************/
	/********************
	CAR
	*********************/
	case "civ_offroad": {
		_className = "C_Offroad_01_F";
		_colors = ["Red","Yellow","White","Blue","Dark Red","Blue / White","Taxi"];
		_settingsFunction = "life_fnc_offroad";
		_yItemTrunkWeight = 65;
		_buyPrice = 12500;
		_rentPrice = 12500;
		_retivalPrice = 10000;
		_sellPrice = 6500;
	};
	case "civ_quadbike": {};
	case "civ_hatchback": {};
	case "civ_suv": {};
	case "civ_hatchback_sport": {};
	case "civ_van_transport": {};
	/********************
	TRUCKS
	*********************/
	case "civ_van_box": {};
	case "civ_zamak_transport": {};
	case "civ_zamak_covered": {};
	case "civ_hemtt_transport": {};
	case "civ_tempest_transport": {};
	case "civ_tempest_covered": {};
	case "civ_hemtt_box": {};
	case "civ_tempest_device": {};
	/*************************************************
	REBEL
	*************************************************/
	case "reb_offroad": {};
	case "reb_ifrit_unarmed": {};
};