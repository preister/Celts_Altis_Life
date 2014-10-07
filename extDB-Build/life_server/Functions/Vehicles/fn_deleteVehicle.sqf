/*
	File: fn_vehicleDead.sqf
	
	Description:
	Tells the database that this vehicle has died and can't be recovered.
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint str _vehicle;
if(isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable["dbInfo",[]];

["delete", _dbInfo] call VEH_fnc_dbVehicle;

sleep (1.3 * 60);
if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};