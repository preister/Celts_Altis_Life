/*
If you need to know anything about a vehicle here it is, easily accessible and readable.
*/

_vehicleName = [_this,0,"",[""]] call BIS_fnc_param;

_className = ""; //the class name of the vehicle
_colors = []; //array of the names of the colors you want to have active for the vehicle
_settingsFunction = ""; //to make vehicles completely modifiable we can select a way we want to vehicle to be spawned (with doors or without ? etc)
_yItemTrunkWeight = 0;

switch(_vehicleName): {
	case "cop_offroad":{
		_className = "C_Offroad_01_F";
		_colors = ["Cop"];
		_settingsFunction = "life_fnc_cop_offroad";
		_yItemTrunkWeight = 65;
	};
};