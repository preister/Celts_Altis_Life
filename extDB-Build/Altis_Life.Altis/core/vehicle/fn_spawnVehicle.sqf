/*
	File: fn_assembleVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	this actually takes care of creating the vehicle in the game world.
*/
private["_spawnpos, _vehicleName"];
_spawnpos = [_this,0,[],[[]]] call BIS_fnc_param; //the position at which to spawn the vehicle
_vehicleType = [_this,1,"",[""]] call BIS_fnc_param; //a string with the name of the vehicle type we want to spawn fe. civ_littlebird
_color = [_this,2] call BIS_fnc_param; //the color (name) the player chose
_ownerUID = [_this,3,"",[""]] call BIS_fnc_param; //the player which is registered as the owner and gets the keys
_ownerProfileName = [_this,4,"",[""]] call BIS_fnc_param; //the player which is registered as the owner and gets the keys


_spawnpos = []; //an arry with either one or 2 field, if only 1 field is given we 
_vehicleName = //a name which can be used to get configuration etc
_className = .... //comes from a config file

_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
waitUntil {!isNil "_vehicle"}; //Wait?
_vehicle allowDamage false;

//to maintain backwards compatibility we need to handle color both as string and number
if !(typeOf "" == typeOf _color) then {
	_color = [_vehicle, _color] call life_fnc_vehicleColorCfg;
};

if(1 == count _spawnpos) then {
	_vehicle setPosATL (_spawnpos);
} else {
	_vehicle setVectorUp (_spawnpos select 2);
	_vehicle setDir (_spawnpos select 1);
	_vehicle setPos (_spawnpos select 0);
};

_vehicle lock 2;
[[_vehicle,_color],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle setVariable["trunk_in_use",false,true];
_vehicle setVariable["vehicle_info_owners",[[_ownerUID,_ownerProfileName]],true];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive. -and we can enable them again ;)

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};
	
	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;

life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.

_vehicle;