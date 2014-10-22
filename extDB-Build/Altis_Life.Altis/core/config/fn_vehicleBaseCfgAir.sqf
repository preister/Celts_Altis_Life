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
	/**************
	CAR
	***************/
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
	/**************
	AIR
	***************/
	case "cop_hummingbird_benches": {
		_className = "B_Heli_Light_01_F";
		_colors = ["CeltS Chopper"];
		_settingsFunction = "life_fnc_hummingbird_benches";
		_yItemTrunkWeight = 90; 
		_buyPrice = 75000; 
		_rentPrice = 75000; 
		_retivalPrice = 10000;
		_sellPrice = 57000;
	};
	/**************
	BOAT
	***************/
	/*************************************************
	MEDICS
	*************************************************/
	/**************
	CAR
	***************/
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
	/**************
	AIR
	***************/
	case "med_hummingbird_benches": {
		_className = "B_Heli_Light_01_F";
		_colors = ["EMS White"];
		_settingsFunction = "life_fnc_hummingbird_benches";
		_yItemTrunkWeight = 90;
		_buyPrice = 50000;
		_rentPrice = 50000;
		_retivalPrice = 10000;
		_sellPrice = 57000;
	};
	case "med_orca": {
		_className = "O_Heli_Light_02_unarmed_F";
		_colors = ["EMS White"];
		_settingsFunction = "life_fnc_orca";
		_yItemTrunkWeight = 210;
		_buyPrice = 75000;
		_rentPrice = 75000;
		_retivalPrice = 15000;
		_sellPrice = 72500;
	};
	/**************
	BOAT
	***************/
	/*************************************************
	CIVS
	*************************************************/
	/**************
	CAR
	***************/
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
	/**************
	AIR
	***************/
	case "civ_hummingbird": {
		_className = "B_Heli_Light_01_F";
		_colors = ["Black","Civ Blue","Civ Red","Blueline","Elliptical","Furious","Jeans Blue","Speedy Redline","Sunset","Vrana","Waves Blue"];
		_settingsFunction = "life_fnc_hummingbird";
		_yItemTrunkWeight = 90;
		_buyPrice = 253000;
		_rentPrice = 253000;
		_retivalPrice = 10000;
		_sellPrice = 57000;
	};
	case "civ_orca": {
		_className = "O_Heli_Light_02_unarmed_F";
		_colors = ["Black","White / Blue"];
		_settingsFunction = "life_fnc_orca";
		_yItemTrunkWeight = 210;
		_buyPrice = 750000;
		_rentPrice = 750000;
		_retivalPrice = 15000;
		_sellPrice = 72500;
	};
	/**************
	BOAT
	***************/
	/*************************************************
	REBEL
	*************************************************/
	/**************
	CAR
	***************/
	/**************
	AIR
	***************/
	case "reb_hummingbird_benches": {
		_className = "B_Heli_Light_01_F";
		_colors = ["Rebel Digital"];
		_settingsFunction = "life_fnc_hummingbird_benches";
		_yItemTrunkWeight = 90;
		_buyPrice = 325000;
		_rentPrice = 325000;
		_retivalPrice = 10000;
		_sellPrice = 57000;
	};
	/**************
	BOAT
	***************/
	
	
	
	
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