/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_unit = _this select 0;
_ammoType = _this select 4; 
_projectile = _this select 6;

//if the unit is restrained it can not fire or throw stuff
//http://www.altisliferpg.com/topic/2241-how-to-add-safenofire-zones-using-eventhandler-function/
if (_unit getVariable "restrained") exitWith {
	deleteVehicle (_projectile);
	hint "You can't do that you are restrained dummy!";
	//but we are nice and put the grenade back into your inventory
	// (just force adding it to the uniform might not be the nicest way of doing this)
	_unit addItemToUniform _ammoType;
};

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		[[_position],"life_fnc_flashbang",true,false] spawn life_fnc_MP;
	};
};