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
if(typeOf _vehicle != "B_Heli_Light_01_F") exitWith {false;}; //this only works on a offroad of this class
//before we start changing anything on the vehicle lets wait a little - this incidentally also means 
// that the vehicle already exists on the client we are about to run this
waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
_vehicle animate ["addDoors",1];
_vehicle animate ["addBenches",0];
_vehicle animate ["addTread",0];
_vehicle animate ["AddCivilian_hide",1];
_vehicle lockCargo [2,true];
_vehicle lockCargo [3,true];
_vehicle lockCargo [4,true];
_vehicle lockCargo [5,true];
//and we are already done - these config files should be all nice and short!