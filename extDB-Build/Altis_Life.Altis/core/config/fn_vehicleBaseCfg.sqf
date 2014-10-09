/*
If you need to know anything about a vehicle here it is, easily accessible and readable.
*/

_vehicleName = [_this,0,"",[""]] call BIS_fnc_param;
_whatInfo = [_this,1,[], []] call BIS_fnc_param; //instead of passing everytime all information back you can ask for something specific with this

_className = ""; //the class name of the vehicle
_colors = []; //array of the names of the colors you want to have active for the vehicle
_settingsFunction = ""; //to make vehicles completely modifiable we can select a way we want to vehicle to be spawned (with doors or without ? etc)
_yItemTrunkWeight = 0;

switch(_vehicleName): {
	case "cop_offroad": {
		_className = "C_Offroad_01_F"; //the base model so to say
		_colors = ["Cop"]; //these are the colors which will be available for this specific vehicle
		_settingsFunction = "life_fnc_cop_offroad"; //this takes care of the specific animation etc details (in prep for some more advanced functionality)
		_yItemTrunkWeight = 65; // how many yItems fit into this vehicle
		_buyPrice = 5000; // * 1.5 - currently still done in buy vehicle;
		_rentPrice = 5000; //not yet working buy price is still rental price * 1.5
		_retivalPrice = 2500; //how much does it cost to get the vehicle out of the garage aka fetch it from the DB
	};
};