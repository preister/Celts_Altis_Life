/*
	File: fn_vehicleCreate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Answers the query request to create the vehicle in the database.
*/
private["_uid","_side","_type","_classname","_color","_plate"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,"",[""]] call BIS_fnc_param;
_vehicle = [_this,2,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_color = [_this,3,-1,[0]] call BIS_fnc_param;

//Error checks
if(_uid == "" OR _side == "" OR _vehicle == "" OR _type == "") exitWith {};

_plate = round(random(1000000));
["insert",[_uid,_side,_type,_vehicle,_color,_plate]] call VEH_fnc_dbVehicle;

_vehicle setVariable["dbInfo",[_uid,_plate]];
_vehicle addEventHandler["Killed","_this spawn VEH_fnc_vehicleDead"];