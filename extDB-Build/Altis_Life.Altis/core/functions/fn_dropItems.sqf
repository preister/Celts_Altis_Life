/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Patrick "SrgFlip" Reister
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_itemName","_amountItem","_varItemName"];
_unit = _this select 0;
{
	_varItemName = _x;
	_amountItem = missionNamespace getVariable _varItemName;
	//we only need to spanw a item if there is one
	if(_amountItem > 0) then
	{
		_itemName = [_varItemName,1] call life_fnc_varHandle;
		_pos = _unit modelToWorld[0,3,0];
		_pos = [_pos select 0, _pos select 1, 0];
		switch(_varItemName) do
		{
			case "life_inv_water": { _obj = "Land_BottlePlastic_V1_F" createVehicle _pos; };
			case "life_inv_tbacon":	{ _obj = "Land_TacticalBacon_F" createVehicle _pos;	};
			case "life_inv_redgull": { _obj = "Land_Can_V3_F" createVehicle _pos; };
			case "life_inv_fuelE": { _obj = "Land_CanisterFuel_F" createVehicle _pos; };
			case "life_inv_fuelF": { _obj = "Land_CanisterFuel_F" createVehicle _pos; };
			case "life_inv_coffee": { _obj = "Land_Can_V3_F" createVehicle _pos; };
			default { _obj = "Land_Suitcase_F" createVehicle _pos; };
		};
		//this makes the objects stuck to the ground and makes them indestructible (aka crash your car on a Suitecase)
		[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
		_obj setPos _pos;
		_obj setVariable["item",[_itemName,_amountItem],true];
		missionNamespace setVariable[_x,0];
		[false,_itemName,_amountItem] call life_fnc_handleInv;
	};
} foreach (life_inv_items);