/*
	File:
	Author: Patrick "SrgFlip" Reister
	
	Description:
	To make the new vehicle system play nicely with an old DB the names need to be translated:
*/
private["_shop","_return"];
_vehicleName = [_this,0,"",[""]] call BIS_fnc_param;
_playerSide = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //NARF! I need to check the player side for some of the vehicles
if(_vehicleName == "") exitWith {[]};

_karts = ["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"];

_return = switch (_vehicleName) do {
	case (_x in _karts): {"Kart";};
	case "C_Offroad_01_F": {
		switch (_playerSide) do {
			case west: {"cop_offroad";};
			case independent: {"med_offroad";};
			default: {"civ_offroad";};
		};
	};
	case "B_Heli_Light_01_F": {
		if _playerSide == civilian: {
			"civ_hummingbird";
		} 
		else {
			"cop_hummingbird_benches";
		};
	};
	case "O_Heli_Light_02_unarmed_F": {"civ_orca";};
	case "B_Quadbike_01_F": {"civ_quadbike";};
	case "C_Hatchback_01_F": {"civ_hatchback";};
	case "C_SUV_01_F": {
		switch (_playerSide) do {
			case west: {"cop_suv";};
			case independent: {"civ_suv";};
		};
	};
	case "C_Van_01_transport_F": {"civ_van_transport";};
	case "C_Hatchback_01_sport_F": {
		switch (_playerSide) do {
			case west: {"cop_hatchback_sport";};
			case independent: {"civ_hatchback_sport";};
		};
	};
	case "C_Van_01_box_F": {"civ_van_box";};
	case "I_Truck_02_transport_F": {"civ_zamak_transport";};
	case "I_Truck_02_covered_F": {"civ_zamak_covered";};
	case "B_Truck_01_transport_F": {"civ_hemtt_transport";};
	case "O_Truck_03_transport_F": {"civ_tempest_transport";};
	case "O_Truck_03_covered_F": {"civ_tempest_covered";};
	case "B_Truck_01_box_F": {"civ_hemtt_box";};
	case "O_Truck_03_device_F": {"civ_tempest_device";};
	case "B_G_Offroad_01_F": {"reb_offroad";};
	case "O_MRAP_02_F": {"reb_ifrit_unarmed";};
	case "I_Heli_Transport_02_F": {"reb_mohawk";};
	case "B_MRAP_01_F": {"cop_hunter_unarmed";};
	case "B_Heli_Transport_01_F": {"cop_ghosthawk";};
	case "C_Rubberboat": {"civ_rubberboat";};
	case "C_Boat_Civil_01_F": {"civ_boat";};
	case "B_Boat_Transport_01_F": {"cop_rubberboat";};
	case "B_Boat_Armed_01_minigun_F": {"cop_speedboat_armed";};
	case "B_SDV_01_F": {"cop_minisubmarine";};
};
_return;

