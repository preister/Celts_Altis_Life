/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_texture","_texture2","_texture3"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_color = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.

if(local _vehicle) then {
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F": {_vehicle setVariable["color",3];};
		case "C_Hatchback_01_F": {_vehicle setVariable["color",1];};
		case "C_Hatchback_01_sport_F": {_vehicle setVariable["color",1];};
		case "C_SUV_01_F": {_vehicle setVariable["color",1];};
		case "C_Van_01_box_F": {_vehicle setVariable["color",1];};
		case "C_Van_01_transport_F": {_vehicle setVariable["color",1];};
	};
};

//Fetch texture from our present array.
_texture = [(typeOf _vehicle),_color] call life_fnc_vehicleColorCfg;
if(isNil "_texture") exitWith {};
if(count _texture == 0) exitWith {};
if(count _texture > 2) then {_texture2 = _texture select 1;};
if(count _texture > 3) then {_texture3 = _texture select 2;};
_texture = _texture select _texture;
if(typeName _texture == "ARRAY") then { _texture = _texture select 0;};

//Local to us? Set it's color.
if(local _vehicle) then
{
	_vehicle setVariable["Life_VEH_color",_color,true];
};

waitUntil{!isNil {_vehicle getVariable "Life_VEH_color"}};

_vehicle setObjectTexture[0,_texture];
if(!isNil "_texture2") then
{
	_vehicle setObjectTexture[1,_texture2];
};
if(!isNil "_texture3") then
{
	_vehicle setObjectTexture[2,_texture3];
};

if(typeOf _vehicle == "C_Offroad_01_F") then
{
	//no idea what this special handling is for TODO figure out
	if(_color in ["Black", "Cop", "Taxi", "Medic"]) then
	{
		_vehicle setObjectTexture[1,_texture];
	};
};