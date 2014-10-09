#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	To make the new vehicle system play nicely with an old DB the names need to be translated:
*/
private["_shop","_return"];
_vehicleName = [_this,0,"",[""]] call BIS_fnc_param;
_playerSide = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //NARF! I need to check the player side for some of the vehicles
if(_vehicleName == "") exitWith {[]};

_karts = ["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"];

switch (_vehicleName) do {
	case (_x in _karts): {"Kart";};
	case "C_Offroad_01_F": {
		switch (_playerSide) do {
			case west: {"cop_offroad";};
			case independent: {"med_offroad";};
			case civilian: {"civ_offroad";};
		};
	};
	case "B_Heli_Light_01_F": {
		if _playerSide == civilian: {
			"civ_littlebird";
		} 
		else {
			"civ_littlebird_benches";
		};
	};
	case "O_Heli_Light_02_unarmed_F": {
		"civ_orca";
	};
	case "B_Quadbike_01_F": {
		"civ_quadbike";
	};
};

_return = [];
switch (_shop) do
{
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000],
			["C_Hatchback_01_sport_F",50000]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",275000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",250000],
			["B_Truck_01_box_F",350000],
			["O_Truck_03_device_F",450000]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",150000],
			["B_Heli_Light_01_F",325000],
			["O_Heli_Light_02_unarmed_F",750000],
			["I_Heli_Transport_02_F",1200000]
		];		
	};
	
	case "cop_car":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		_return set[count _return,
		["C_SUV_01_F",20000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",20000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
		};
		
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",253000],
			["O_Heli_Light_02_unarmed_F",750000]
		];
	};
	
	case "cop_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];
		};
	};
	
	case "cop_airhq":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",75000],
			["B_SDV_01_F",100000]
		];
	};
};

_return;
