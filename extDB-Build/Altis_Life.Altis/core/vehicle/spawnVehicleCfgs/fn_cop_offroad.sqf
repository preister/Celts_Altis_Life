/*
	File: fn_vehicleAnimate.sqf
	Author: Patrick "SrgFlip" Reister
	
	Description:
	This does all the necessary changes to a C_Offroad_01_F if we spawn it as a cop_offroad.
*/
private["_vehicle","_animate","_state"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
//do some error checking here
if(isnull _vehicle) exitwith {false;}; //FUCK
if(typeOf _vehicle != "C_Offroad_01_F") exitWith {false;}; //this only works on a offroad of this class
//before we start changing anything on the vehicle lets wait a little - this incidentally also means 
// that the vehicle already exists on the client we are about to run this
waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
_vehicle animate ["HidePolice", 0];
_vehicle animate ["HideBumper1", 0];
_vehicle setVariable["lights",false,true];
//and we are already done - these config files should be all nice and short!
