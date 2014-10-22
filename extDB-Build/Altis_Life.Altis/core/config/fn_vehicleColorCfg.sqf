/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Patrick "SrgFlip" Reister
	
	Description:
	This translates the nice player "colors" into their actual skin representations
	
	If you want to add a new skin to a vehicle just do it here and give it a unique name, which 
	colors are accessible in the shop can be configured in the fn_vehicleBaseCfg.sqf
*/
private["_vehicle","_ret","_path"];
_vehicleClassName = [_this,0,"",[""]] call BIS_fnc_param; //we go by the class name, skins are class specific
_color = [_this,1,"",[""]] call BIS_fnc_param;
if(_vehicle == "" OR _color == "") exitWith {[]};
_ret = [];

switch (_vehicleClassName) do {
	case "I_Heli_Transport_02_F": {
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret = switch (_color) do {
			case "Rebel": { ["textures\Texture_Mohawk_0_Hull.paa","textures\Texture_Mohawk_1_Fin_Door.paa","textures\Texture_Mohawk_2_Fuselage.paa"]; };
			case "Black": { [_path+"heli_transport_02_1_ion_co.paa",_path+"heli_transport_02_2_ion_co.paa",_path+"heli_transport_02_3_ion_co.paa"]; };
			case "Green": { [_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"]; };
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret = switch (_color) do {
			case "Red": 			{ _path + "hatchback_01_ext_sport01_co.paa"; };
			case "Dark Blue" 		{ _path + "hatchback_01_ext_sport02_co.paa"; };
			case "Orange": 			{ _path + "hatchback_01_ext_sport03_co.paa"; };
			case "Black / White": 	{ _path + "hatchback_01_ext_sport04_co.paa"; };
			case "Tan": 			{ _path + "hatchback_01_ext_sport05_co.paa"; };
			case "Green": 			{ _path + "hatchback_01_ext_sport06_co.paa"; };
			case "Cop": 			{ "textures\uk_police_hatchback_co.paa"; };
			case "Barbie": 			{ "textures\barbie.paa"; };
		};
	};
		
	case "C_Offroad_01_F":
	{
		_path = "\A3\soft_F\Offroad_01\Data\";
		_ret = switch (_color) do {
			case "Red": 		{ _path + "offroad_01_ext_co.paa"; };
			case "Yellow": 		{ _path + "offroad_01_ext_BASE01_CO.paa"; };
			case "White": 		{ _path + "offroad_01_ext_BASE02_CO.paa"; };
			case "Blue": 		{ _path + "offroad_01_ext_BASE03_CO.paa"; };
			case "Dark Red": 	{ _path + "offroad_01_ext_BASE04_CO.paa"; };
			case "Blue / White":{ _path + "offroad_01_ext_BASE05_CO.paa"; };
			case "Black": 		{ "#(ai,64,64,1)Fresnel(0.3,3)"; };
			case "Cop": 		{ "textures\uk_police_offroad_co.paa"; };
			case "Taxi": 		{ "#(argb,8,8,3)color(0.6,0.3,0.01,1)"; };
			case "Medic": 		{ "textures\pickup_medic.paa"; };
		};
	};
	
	case "C_Hatchback_01_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret = switch (_color) do {
			case "Beige": 		{ _path + "hatchback_01_ext_base01_co.paa"; };
			case "Green": 		{ _path + "hatchback_01_ext_base02_co.paa"; };
			case "Blue": 		{ _path + "hatchback_01_ext_base03_co.paa"; };
			case "Dark Blue": 	{ _path + "hatchback_01_ext_base04_co.paa"; };
			case "Yellow": 		{ _path + "hatchback_01_ext_base06_co.paa"; };
			case "White": 		{ _path + "hatchback_01_ext_base07_co.paa"; };
			case "Grey": 		{ _path + "hatchback_01_ext_base08_co.paa"; };
			case "Black": 		{ _path + "hatchback_01_ext_base09_co.paa"; };
		};
	};
	
	case "C_SUV_01_F":
	{
		_path = "\a3\soft_f_gamma\SUV_01\Data\";
		_ret = switch (_color) do {
			case "Dark Red":{ _path + "suv_01_ext_co.paa"; };
			case "Black": 	{ _path + "suv_01_ext_02_co.paa"; };
			case "Silver": 	{ _path + "suv_01_ext_03_co.paa"; };
			case "Orange": 	{ _path + "suv_01_ext_04_co.paa"; };
			case "Cop": 	{ "textures\uk_police_suv_co.paa"; };
			case "Makaveli":{ "textures\suv_makaveli.paa"; };
			case "Medic": 	{ "textures\pickup_medic.paa"; };
		};
	};
	
	//this way you can make 2 vehicles have the same skin
	case (_x in ["C_Van_01_box_F","C_Van_01_transport_F","C_Van_01_fuel_F"]:
	{
		_path = "\a3\soft_f_gamma\Van_01\Data\";
		_ret = switch (_color) do {
			case "White": 	{ _path + "van_01_ext_co.paa"; };
			case "Red":		{ _path + "van_01_ext_red_co.paa"; };
		}; 
	};
	
	case "B_Quadbike_01_F":
	{
		_path1 = "\A3\Soft_F\Quadbike_01\Data\";
		_path2 = "\A3\Soft_F_beta\Quadbike_01\Data\";
		_path3 = "\a3\soft_f_gamma\Quadbike_01\data\";
		_ret = switch (_color) do {
			case "Brown": 		{ _path1 + "quadbike_01_co.paa"; };
			case "Rebel Desert":{ _path1 + "quadbike_01_opfor_co.paa"; };
			case "Black": 		{ _path2 + "quadbike_01_civ_black_co.paa"; };
			case "Blue": 		{ _path2 + "quadbike_01_civ_blue_co.paa"; };
			case "Red": 		{ _path2 + "quadbike_01_civ_red_co.paa"; };
			case "White": 		{ _path2 + "quadbike_01_civ_white_co.paa"; };
			case "White": 		{ _path2 + "quadbike_01_indp_co.paa"; };
			case "Hunter Camo":	{ _path3 + "quadbike_01_indp_hunter_co.paa"; };
			case "Rebel Camo":	{ _path3 + "quadbike_01_indp_hunter_co.paa"; };
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		_path1 = "\a3\air_f\Heli_Light_01\Data\Skins\";
		_path2 = "\a3\air_f\Heli_Light_01\Data\";
		_path3 = "\a3\air_f\Heli_Light_01\Data\Skins\";
		_ret = switch (_color) do {
			//case "Sheriff":			{ _path1 + "heli_light_01_ext_sheriff_co.paa"; };
			case "Black":			{ _path2 + "heli_light_01_ext_ion_co.paa"; };
			case "Civ Blue":		{ _path2 + "heli_light_01_ext_blue_co.paa"; };
			case "Civ Red":			{ _path2 + "heli_light_01_ext_co.paa"; };
			case "Digi Green":		{ _path2 + "heli_light_01_ext_indp_co.paa"; };
			case "Blueline":		{ _path3 + "heli_light_01_ext_blueline_co.paa"; };
			case "Elliptical":		{ _path3 + "heli_light_01_ext_elliptical_co.paa"; };
			case "Furious":			{ _path3 + "heli_light_01_ext_furious_co.paa"; };
			case "Jeans Blue":		{ _path3 + "heli_light_01_ext_jeans_co.paa"; };
			case "Speedy Redline":	{ _path3 + "heli_light_01_ext_speedy_co.paa"; };
			case "Sunset":			{ _path3 + "heli_light_01_ext_sunset_co.paa"; };
			case "Vrana":			{ _path3 + "heli_light_01_ext_vrana_co.paa"; };
			case "Waves Blue":		{ _path3 + "heli_light_01_ext_wave_co.paa"; };
			case "Rebel Digital":	{ _path3 + "heli_light_01_ext_digital_co.paa"; };
			case "EMS White":		{ "textures\heli_med.paa"; };
			case "CeltS Chopper":	{ "textures\celtscopter.paa"; };
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_path = "\a3\air_f\Heli_Light_02\Data\";
		_ret = switch (_color) do {
			case "Black":		{ _path + "heli_light_02_ext_co.paa" };
			case "White / Blue":{ _path + "heli_light_02_ext_civilian_co.paa" };
			case "Digi Green":	{ _path + "heli_light_02_ext_indp_co.paa" };
			case "Desert Digi":	{ _path + "heli_light_02_ext_opfor_co.paa" };
			case "EMS White":	{ "textures\heli2_med.paa" };
		};
	};
	
	case "B_MRAP_01_F":
	{
		_ret = switch (_color) do {
			case "Regular": { "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa"; };
			case "Black":	{ "#(argb,8,8,3)color(0.05,0.05,0.05,1)"; };
			case "SWAT":	{ ["textures\swat_hunter.paa","textures\hunter_back.paa"]; };
		};
	};
	
	case (_x in ["I_Truck_02_covered_F","I_Truck_02_transport_F"]):
	{
		_path = "\A3\Soft_F_Beta\Truck_02\data\";
		_ret = switch (_color) do {
			case "Orange":  { [_path + "truck_02_kab_co.paa","civ",_path + "truck_02_kuz_co.paa"]; };
			case "Black":	{ "#(argb,8,8,3)color(0.05,0.05,0.05,1)"; };
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = switch (_color) do {
			case "Black":	{ "#(argb,8,8,3)color(0.05,0.05,0.05,1)"; };
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = switch (_color) do {
			case "Black":	{ "#(argb,8,8,3)color(0.05,0.05,0.05,1)"; };
		}; 
	};
};

_ret;