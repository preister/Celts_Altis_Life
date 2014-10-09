#include <macro.h>
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_vehicleName","_basePrice","_color","_spawnPoint","_vehicle"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_vehicleName = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
_color = lbCurSel 2304;
_color = call compile format["%1", _color];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(life_cash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - life_cash] call life_fnc_numberText];};
if(!([_vehicleName] call life_fnc_vehShopLicenses) && _vehicleName != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};

if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_spawnpos = [(_hs modelToWorld [-0.4,-4,14])];
} else {
	_spawnpos = [(getMarkerPos _spawnPoint), (markerDir _spawnPoint), surfaceNormal (getMarkerPos _spawnPoint)];
};
//we know where lets do it life_fnc_spawnVehicle takes care of all remote stuff for us and we wait because there is nothing better to do
_vehicle = [_spawnpos,_vehicleName,_color,getPlayerUID player,profileName] call life_fnc_spawnVehicle;
//?did something bad happen while we where waiting?
if !(alive _vehicle) exitWith{ hint "We are very sorry but something bad happened to your vehicle."; closeDialog 0; false;};
//ok we are almost done, rented or bought?
if(_mode && !(_vehicleName in __GETC__(life_only_rentable))) then {
	//if you buy it its 1.5 times more expensive TODO: MAKE THIS CONFIGURABLE
	_basePrice = round(_basePrice * 1.5)
	//no matter what happens we want to have the cash before the car gets stored in the db
	life_cash = life_cash - _basePrice;
	hint format[localize "STR_Shop_Veh_Bought",_vehicleName),[_basePrice] call life_fnc_numberText];
	
	_type = switch(true) do
	{
		case (_vehicle isKindOf "Car"): {"Car"};
		case (_vehicle isKindOf "Air"): {"Air"};
		case (_vehicle isKindOf "Ship"): {"Ship"};
	};

	_side = switch(playerSide) do
	{
		case west:{"cop"};
		case civilian: {"civ"};
		case independent: {"med"};
		default {"Error"};
	};
	[[(getPlayerUID player),_side,_vehicleName,_type,_color],"VEH_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
}
else {
	life_cash = life_cash - _basePrice;
	hint format["You rented a %1 for $%2",_vehicleName),[_basePrice] call life_fnc_numberText];
};
//
[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;