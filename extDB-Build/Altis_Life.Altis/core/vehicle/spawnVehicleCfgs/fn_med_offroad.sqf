/*
	File: fn_vehicleAnimate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pass what you want to be animated.
*/
private["_vehicle"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
//do some error checking here
if(isnull _vehicle) exitwith {false;}; //FUCK
if(typeOf _vehicle != "C_Offroad_01_F") exitWith {false;}; //this only works on a offroad of this class
waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
_vehicle animate ["HidePolice", 0];
_vehicle setVariable["lights",false,true];
//and we are already done - these config files should be all nice and short!