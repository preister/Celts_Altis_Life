/*
	File: fn_vehicleIsDead.sqf
	Author: Kevin Webb
	Description:
	Used for the copCrush function: deletes the vehicle from the database.
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;

_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];

waitUntil {!DB_Async_Active};
_thread = [_query,1] call DB_fnc_asyncCall;


if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};