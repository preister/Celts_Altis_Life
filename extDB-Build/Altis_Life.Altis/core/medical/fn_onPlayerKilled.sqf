#include <macro.h>
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit enableFatigue false;

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

//drop gear for all sides that don't keep their items after death
if(!(playerSide in life_death_save_gear)) then {
	_handle = [_unit] spawn life_fnc_dropItems;
	waitUntil {scriptDone _handle};
	//and save all the changes we made
	[] call life_fnc_saveGear;
}
else {
	//if people keep their gear we just remove it now so nobody can steal it while they are down
	// this action isnt saved so when they respawn they just load the old stuff
	private["_containers"];
	_containers = nearestObjects[getPosATL _unit,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} forEach _containers; //Delete the containers.
	//to avoid duplication of items after respawning we remove as much as possible - gona worry about duplicating clothing later
	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	clearMagazineCargo _unit;
	removeVest _unit;
	removeUniform _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	//including the yItems so we dont double them
	{
		_item = [_x,1] call life_fnc_varHandle;
		_value = missionNamespace getVariable _x;
		//and now that we are done with that we can remove the item from the player inventory
		if(_value > 0) then {[false,_item,_value] call life_fnc_handleInv;};
	} foreach (life_inv_items);
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		//get the ticket for the crime and 
		[_killer, "187V"] call life_fnc_chargeCrime;
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	} else {
		[_killer, "187"] call life_fnc_chargeCrime;
		if(!local _killer) then {
			[[3],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {life_cash > 0}) then {
		[format[localize "STR_Cop_RobberDead",[life_cash] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_cash = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

//dropping the cash
//moved this out of dropItems, it was already a special case there and we want everybody to drop
//cash even cops
if(life_cash > 0) then
{
	_pos = _unit modelToWorld[0,3,0];
	_pos = [_pos select 0, _pos select 1, 0];
	_obj = "Land_Money_F" createVehicle _pos;
	_obj setVariable["item",["money",life_cash],true];
	_obj setPos _pos;
	[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
};
life_cash = 0;	
life_hunger = 100;
life_thirst = 100;


[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
