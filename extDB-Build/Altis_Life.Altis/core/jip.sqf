/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	JIP functionality for JIP required things like vehicles.
	
	Runs when the player loads the mission and makes sure all 
	existing reskins work appropriately
*/

//color all the cars
{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

//color all the helicopters
{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");

//and give everybody their Rangemaster skin -- ugly but necessary -- ToDo: Fix this with the vehicle rework
{
	//make sure that all the Rangemaster shirts gets skinned again correctly
	if(uniform _x == "U_Rangemaster") then {
		private["_texture"];
		_texture = "";
		switch(side _x) do {
			case independent: {
				_texture = "textures\medic_uniform.jpg";
			};
			case west: {
				_texture = "textures\police_uniform_co.jpg";
			};
		};
		if(_texture != "") then {
			//we only need to run this on this particular client, everybody else knows already about it
			[_x,0,_texture] spawn life_fnc_setTexture;
		};
	};
} foreach (playableUnits);